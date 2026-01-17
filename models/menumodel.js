const pool = require('../config/dbconn'); 

class MenuModel {
    // 1. Get all menus for the main list view
    async getAllMenus() {
        const query = 'SELECT * FROM menus ORDER BY id DESC';
        try {
            const { rows } = await pool.query(query);
            return rows;
        } catch (error) {
            console.error('Database Error in getAllMenus:', error);
            throw error;
        }
    }

    // 2. Get a single basic menu record by ID
    async getMenuById(id) {
        const query = 'SELECT * FROM menus WHERE id = $1';
        try {
            const { rows } = await pool.query(query, [id]);
            return rows[0];
        } catch (error) {
            console.error('Database Error in getMenuById:', error);
            throw error;
        }
    }

    // 3. Retrieves full nested details (Invoice + Contexts + Items) for Editing/Preview
    async getFullMenuDetails(id) {
        const query = `
            SELECT
                m.id AS menu_id, m.customer_name, m.contact, m.place, m.date AS booking_date,
                i.subtotal, i.gst, i.grand_total, i.advance, i.balance, 
                i.lead_counters, i.water_bottles, i.cooking_charges, i.labour_charges, i.transport_charges,
                COALESCE(
                    json_agg(
                        json_build_object(
                            'context_id', mc.id, 'event_date', mc.event_date, 'meal', mc.meal, 'members', mc.members, 'buffet', mc.buffet,
                            'categories', (
                                SELECT COALESCE(
                                    json_agg(
                                        json_build_object('category_id', mcat.id, 'category_name', mcat.category_name,
                                            'items', (
                                                SELECT COALESCE(json_agg(mi.item_name), '[]'::json)
                                                FROM menu_items mi WHERE mi.category_id = mcat.id
                                            )
                                        )
                                    ), '[]'::json)
                                FROM menu_categories mcat WHERE mcat.context_id = mc.id
                            )
                        )
                    ) FILTER (WHERE mc.id IS NOT NULL), '[]'::json) AS menu_contexts
            FROM
                menus m
            LEFT JOIN invoices i ON m.id = i.menu_id
            LEFT JOIN menu_contexts mc ON m.id = mc.menu_id
            WHERE
                m.id = $1
            GROUP BY
                m.id, m.customer_name, m.contact, m.place, m.date,
                i.subtotal, i.gst, i.grand_total, i.advance, i.balance, 
                i.lead_counters, i.water_bottles, i.cooking_charges, i.labour_charges, i.transport_charges;
        `;
        
        try {
            const { rows } = await pool.query(query, [id]); 
            return rows.length === 0 ? null : rows[0]; 
        } catch (error) {
            console.error('Database Error in getFullMenuDetails:', error);
            throw error;
        }
    }

    // 4. Create a basic new menu
    async createMenu({ customer_name, contact, place, date }) {
        const query = `
          INSERT INTO menus (customer_name, contact, place, date)
          VALUES ($1, $2, $3, $4)
          RETURNING *;
        `;
        const values = [customer_name, contact, place, date];
        try {
            const { rows } = await pool.query(query, values);
            return rows[0];
        } catch (error) {
            if (error.code === '23505') throw new Error('Phone number already exists');
            console.error('Database Error in createMenu:', error);
            throw error;
        }
    }

    // 5. THE CRITICAL FIX: Update everything in one Transaction
    async updateFullMenuTransaction(menuId, data) {
        const client = await pool.connect();
        try {
            await client.query('BEGIN'); // Start Transaction

            // A. Update main Menu details
            await client.query(
                `UPDATE menus SET customer_name = $1, contact = $2, place = $3, date = $4 WHERE id = $5`,
                [data.customer_name, data.contact, data.place, data.booking_date, menuId]
            );

            // B. Update Invoice data (Ensures pricing is synced)
            await client.query(
                `UPDATE invoices SET 
                    subtotal=$1, gst=$2, grand_total=$3, advance=$4, balance=$5, 
                    lead_counters=$6, water_bottles=$7, cooking_charges=$8, labour_charges=$9, transport_charges=$10 
                 WHERE menu_id=$11`,
                [
                    data.subtotal || 0, data.gst || 0, data.grand_total || 0, data.advance || 0, data.balance || 0,
                    data.lead_counters || 0, data.water_bottles || 0, data.cooking_charges || 0, 
                    data.labour_charges || 0, data.transport_charges || 0, menuId
                ]
            );

            // C. Clear existing nested data (The "Wipe and Rewrite" strategy)
            // This relies on ON DELETE CASCADE in your database
            await client.query('DELETE FROM menu_contexts WHERE menu_id = $1', [menuId]);

            // D. Re-insert nested Contexts -> Categories -> Items
            if (data.menu_contexts && Array.isArray(data.menu_contexts)) {
                for (const ctx of data.menu_contexts) {
                    const ctxRes = await client.query(
                        `INSERT INTO menu_contexts (menu_id, event_date, meal, members, buffet) 
                         VALUES ($1, $2, $3, $4, $5) RETURNING id`,
                        [menuId, ctx.event_date, ctx.meal, ctx.members, ctx.buffet]
                    );
                    const newContextId = ctxRes.rows[0].id;

                    for (const cat of (ctx.categories || [])) {
                        const catRes = await client.query(
                            `INSERT INTO menu_categories (context_id, category_name) VALUES ($1, $2) RETURNING id`,
                            [newContextId, cat.category_name]
                        );
                        const newCatId = catRes.rows[0].id;

                        for (const itemName of (cat.items || [])) {
                            await client.query(
                                `INSERT INTO menu_items (category_id, item_name) VALUES ($1, $2)`,
                                [newCatId, itemName]
                            );
                        }
                    }
                }
            }

            await client.query('COMMIT'); // Finalize all changes
            return true;
        } catch (error) {
            await client.query('ROLLBACK'); // Undo everything if one step fails
            console.error('Transaction Error:', error);
            throw error;
        } finally {
            client.release();
        }
    }

    // 6. Delete a menu (and its cascading children)
    async deleteMenu(id) {
        const query = 'DELETE FROM menus WHERE id = $1';
        try {
            await pool.query(query, [id]);
            return true;
        } catch (error) {
            console.error('Database Error in deleteMenu:', error);
            throw error;
        }
    }
}

module.exports = new MenuModel();