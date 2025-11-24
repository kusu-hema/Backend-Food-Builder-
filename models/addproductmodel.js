const pool = require('../config/dbconn');

// Renamed the class from CategoryModel to ProductModel
class ProductModel {
  // Renamed the method to getAllProducts
  async getAllProducts() {
    // Select all columns from the new table schema
    const query = 'SELECT * FROM products';
    const { rows } = await pool.query(query);
    return rows;
  }

  // Renamed the method to getProductById
  async getProductById(id) {
    // Select a single record by the primary key `sno`
    const query = 'SELECT * FROM products WHERE sno = $1';
    const { rows } = await pool.query(query, [id]);
    return rows[0];
  }

  // Renamed the method to createProduct
  async createProduct({ image, product, category, action }) {
    // Insert a new record using the new column names
    const query = `
      INSERT INTO products (image, product, category, action)
      VALUES ($1, $2, $3, $4)
      RETURNING *;
    `;
    const values = [image, product, category, action];
    const { rows } = await pool.query(query, values);
    return rows[0];
  }

  // Renamed the method to updateProduct
  async updateProduct(id, { image, product, category, action }) {
    // Update a record using the new column names
    const query = `
      UPDATE products
      SET image = $1, product = $2, category = $3, action = $4
      WHERE sno = $5
      RETURNING *;
    `;
    const values = [image, product, category, action, id];
    const { rows } = await pool.query(query, values);
    return rows[0];
  }

  // Renamed the method to deleteProduct
  async deleteProduct(id) {
    // Delete a record by `sno`
    const query = 'DELETE FROM products WHERE sno = $1;';
    await pool.query(query, [id]);
    return true;
  }
}

// Updated the exported instance to use the new class name
module.exports = new ProductModel();
