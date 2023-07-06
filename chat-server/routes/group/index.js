const express = require('express');
const groupValidations = require('../../validations/group');
const groupController = require('../../controllers/group');
const Validator = require('../../middlewares/Validator');
const userExists = require('../../middlewares/user/userExists');

const router = express.Router();

router.post('/add', Validator(groupValidations.createGroupValidation), groupController.add);
router.get('/', groupController.getAll);

module.exports = router;