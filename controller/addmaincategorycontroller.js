const model = require ('../models/addmaincategorymodel');


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
        console.error('Error fetching catergory:', error);
        res.status(500).json({ message : 'Internal Server Error '});
    }
}


const createMainCategory = async (req, res) => {
    try{
        const newMenu = await model. createMainCategory (req.body);
        res.status(201).json (newMenu);
    }
    catch (error){
        console.error('Error creating menu:', error);
        res.status(500).json ({ message : 'Internal Server Error'});
    }
}



const updateMainCategory = async (req, res) => {
    try{
        const updatemaincategory = await model.updateMainCategory (req.params.id, req.body);
        if (!updatemaincategory) return res.status (404).json ({ message : 'Menu not found'});
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
 
 

 
