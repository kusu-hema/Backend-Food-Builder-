const model = require ('../models/addmaincategorymodel');
// const model = require('../models/addproductmodel'); 


// Get all Categorys
const getMainCategory = async (req, res) => {
    try{
        const menus = await model.getAllMainCategory();
        res.status(200).json(menus);
    } catch (error) {
        console.error ('Error fetching category:', error);
        res.status(500).json({ message: ' Internal Server Error ' });
    }
};

const getMainCategoryById = async (req, res) =>{
    try {
        const category = await model.getMainCategoryById (req.params.id);
        if (!category) return res.status(404).json({message : 'Category not found'});
        res.status (200).json(category);
    }
    catch (error){
        console.error('Error fetching category:', error);
        res.status(500).json({ message : 'Internal Server Error '});
    }
}


// const createMainCategory = async (req, res) => {
//     try{
//         const newMenu = await model. createMainCategory (req.body);
//         res.status(201).json (newMenu);
//     }
//     catch (error){
//         console.error('Error creating category:', error);
//         res.status(500).json ({ message : 'Internal Server Error'});
//     }
// }



const createMainCategory = async (req, res) => {
    try {
        console.log("Data received from frontend:", req.body); // Check your terminal for this!

        const { sno, category_name } = req.body;

        // Validation: Don't even try to call the model if data is missing
        if (!category_name) {
            return res.status(400).json({ message: 'category_name is required' });
        }

        const newMenu = await model.createMainCategory({ sno, category_name });
        res.status(201).json(newMenu);
    }
    catch (error) {
        console.error('Error creating category:', error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
}



const updateMainCategory = async (req, res) => {
    try{
        const updatemaincategory = await model.updateMainCategory (req.params.id, req.body);
        if (!updatemaincategory) return res.status (404).json ({ message : 'category not found'});
        res.status(200).json (updatemaincategory);
    }
    catch (error){
        console.error('Error updating category:', error);
        res.status(500).json({ message : 'Internal server Error '});
    }
}
 
 
const deleteMainCategory = async (req, res) => {
    try{
        await model.deleteMainCategory (req.params.id);
        res.status (200).json ({ message : 'Category delete successfully'});
    }
    catch (error){
        console.error('Error delete category :', error);
        res.status (500) .json ({ message : 'Internal sever Error '});
    }
}

 
module.exports = {
    getMainCategory, 
    getMainCategoryById, 
    createMainCategory, 
    updateMainCategory, 
    deleteMainCategory,
};