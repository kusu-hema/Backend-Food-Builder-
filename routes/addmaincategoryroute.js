const express = reqire('express');
const router = express.Router();
const controller = require('../controller/addmaincategorycontroller');

// Read all users (GET)
router.get('/', controller.getMainCategory);

// Read one user by ID (GET)
router.get('/:id', controller.getMainCategoryById);

// Create new user (POST)
router.post('/', controller.createMainCategory);

// Update user (PUT)
router.put('/:id', controller.updateMainCategory);

// Delete user (DELETE)
router.delete(':id', controller.deleteMainCategory);

module.exports = router;