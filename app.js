const express = require("express");  // Frame  work {middle ware }
const cors = require("cors");     // Cross-Origin Resource Sharing
const bodyParser = require("body-parser");  //  handling incoming data in a variety of formats, such as JSON, URL-encoded form data, and raw or text data. - middle ware 

const app = express();  // Frame work


// Import the new category routes
const customerRoutes = require("./routes/authroute");
const productRoutes = require("./routes/addproductroute");
const categoryRoutes = require("./routes/addcategoryroute"); 
const addmaincategoryroute = require("./routes/addmaincategoryroute");

// INVOICE API 
const menuRoutes = require("./routes/menuroute");    
const menucontextRoutes = require("./routes/menucontextsroute");
const menuitemsRoutes = require("./routes/menuitemsroute");
const menuinvoiceRoutes = require("./routes/menuinvoiceroute");  
const menucategoriesRoutes = require("./routes/menucategoriesroute");


const menupdfinvoiceRoutes = require("./routes/menupdfinvoiceroute");


// Middleware
app.use(cors());
app.use(bodyParser.json());

// This line is CRITICAL for the Body tab in Postman to work
app.use(express.json());

// This is the critical line to serve images from the 'uploads' directory
app.use('/uploads', express.static('uploads'));


//  NEW: This serves your generated PDF invoices!
app.use('/invoices', express.static('invoices'));

// Base routes for your 'APIs'
app.use('/api/customers', customerRoutes);
app.use('/api/products', productRoutes);
app.use('/api/categories', categoryRoutes);
app.use('/api/maincategory', addmaincategoryroute);

// INVOICE API 
app.use('/api/menus', menuRoutes);
app.use('/api/menucontext', menucontextRoutes);
app.use('/api/menuitems', menuitemsRoutes);
app.use('/api/menuinvoice', menuinvoiceRoutes);
app.use('/api/menucategories', menucategoriesRoutes);

app.use('/api/menupdfinvoice',menupdfinvoiceRoutes);



// Health check route (optional)
app.get("/", (req, res) => {
//  res.send("Customer, Product, and Category APIs are running");
 res.send(" Backend is running");

});

// Start the server
const port = 4000;
app.listen(port, () => {
 console.log(`Server is running on http://localhost:${port}`);
});