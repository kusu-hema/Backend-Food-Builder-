const pool = require('../config/dbconn');

class categoryModel {

    async getAllMainCategory () {
        const query = 'SELECT * FROM categories';
        const {rows} = await pool.query(query);
        return rows;
    }

    async getMainCategoryById (id) {
       const query = 'SELECT * FROM categories WHERE sno = $1';
       const { rows } = await pool.query(query,[id]);
       return rows[0];
    }

    async createMainCategory ({ sno, category_name }){
        const query = `
        INSERT INTO categories (sno, category_name)
        VALUES ($1, $2)
        RETURNING *;
        `;
        const values = [sno, category_name];
        const { rows } = await pool.query(query, values);
        return rows[0];
    }

    // async updateMainCategory (id, {sno, category_name}) {
    //     const query = `
    //     UPDATE  categories 
    //     SET sno = $1, category_name = $2
    //     WHERE sno = $3
    //     RETURNING *;
    //     `;
    //     const values = [sno, category_name, id];
    //     const { rows } = await pool.query(query, values);
    //     return rows [0];
    // }


    // Change this in your categoryModel class
    
    async updateMainCategory (id, {sno, category_name}) {
        const query = `
        UPDATE categories 
        SET sno = $1, category_name = $2
        WHERE id = $3  -- Use id here, not sno
        RETURNING *;
        `;
        const values = [sno, category_name, id];
        const { rows } = await pool.query(query, values);
        return rows[0];
    }

    async deleteMainCategory(id) {
        const query = 'DELETE FROM categories WHERE sno = $1;';
        await pool.query(query, [id]);
        return true;
    }
}


// Updated the exported instance to use the new class name
module.exports = new categoryModel();
