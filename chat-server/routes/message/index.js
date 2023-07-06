const express = require('express');
const messageController = require('../../controllers/message');
const messageValidations = require('../../validations/message');
const Validator = require('../../middlewares/Validator');
const groupExists = require('../../middlewares/group/groupExists');

const router = express.Router();

router.post('/add', Validator(messageValidations.createMessageValidation), groupExists, messageController.add);
router.get('/group/:id(\\d+)', groupExists, messageController.getByGroup);

module.exports = router;