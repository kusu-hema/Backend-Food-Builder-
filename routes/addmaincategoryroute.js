const express = reqire('express');
const router = express.Router();
const controller = require('../controller/addmaincategorycontroller');

// Read all users (GET)
router.get('/', controller.getmaincategory);

// Read one user by ID (GET)
router.get('/:id', controller.getmaincategoryById);

// Create new user (POST)
router.post('/', controller.createmaincategory);

// Update user (PUT)
router.put('/:id', controller.updatemaincategory);

// Delete user (DELETE)
router.delete(':id', controller.deletemaincategory);
module.exports = router; 

 
 







 