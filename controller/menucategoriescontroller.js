const model = require ('../models/menucategoriesmodel');

// Get all menus
const getMenuCatergories = async (req, res) =>{
    try{
        const menus = await model.getAllMenuCategories();
        res.status(200).json(menus);
    }catch (error){
        console.error ('Error fetching menus:', error);
        res.ststus (500).json ({ messge: 'Internal Server Error'});
    }
    
    }

// Get one menu by ID 

const getMenuCategoriesById = async (req, res) => {
    try{
        const menu = await model.getMenuCategoriesById(req.params.id);
        if (!menu) return res.status(404).json({ message: "Menu not found "});
        res.status(200).json (menu);
    }
    catch (error) {
        console.error('Error fetching menu:', error);
        res.status(500).json ({ message : 'Internal server Error ' });
    }
}

//  Get one menu by ID
// const createMenuCategories = async (req, res) => {
//   try {
//     const menu = await model.createMenuCategories(req.params.id);
//     if (!menu) return res.status(404).json({ message: 'Menu not found' });
//     res.status(200).json(menu);
//   } catch (error) {   
//     console.error('Error fetching menu:', error);
//     res.status(500).json({ message: 'Internal Server Error' });
//   }
// };

const createMenuCategories = async (req, res) => {
  try {
    // 1. Log to see what React is sending
    console.log("Body received in controller:", req.body);

    // 2. Validate that req.body exists
    if (!req.body || Object.keys(req.body).length === 0) {
      return res.status(400).json({ message: 'Request body is missing' });
    }

    // 3. Pass req.body to the model (this contains context_id and category_name)
    // Your previous code was passing req.params.id, which was likely undefined
    const newCategory = await model.createMenuCategories(req.body);
    
    res.status(201).json(newCategory);
  } catch (error) {   
    console.error('Error in createMenuCategories controller:', error);
    res.status(500).json({ message: 'Internal Server Error', error: error.message });
  }
};


//  Update menu
const updateMenuCategories = async (req, res) => {
  try {
    const updatedMenu = await model.updateMenuCategories(req.params.id, req.body);
    if (!updatedMenu) return res.status(404).json({ message: 'Menu not found' });
    res.status(200).json(updatedMenu);
  } catch (error) {
    console.error('Error updating menu:', error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
};

//  Delete menu
const deleteMenuCategories = async (req, res) => {
  try {
    await model.deleteMenuCategories(req.params.id);
    res.status(200).json({ message: 'Menu deleted successfully' });
  } catch (error) {
    console.error('Error deleting menu:', error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
};

module.exports = {
  getMenuCatergories,
  getMenuCategoriesById,
  createMenuCategories,
  updateMenuCategories,
  deleteMenuCategories,
};
