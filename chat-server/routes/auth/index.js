const express = require('express');
const joi = require('joi');
const authController = require('../../controllers/auth');
const Validator = require('../../middlewares/Validator');
const validations = require('../../validations/auth');
const uniqueEmail = require('../../middlewares/auth/uniqueEmail');
const uniqueUsername = require('../../middlewares/auth/uniqueUsername');

const router = express.Router();

const schema = joi.object({
   firstName: joi.string().min(3).max(25).required(),
})

router.post('/register', Validator(validations.registerValidation), uniqueEmail, uniqueUsername, authController.register);
router.post('/login', Validator(validations.loginValidation), authController.login);
router.get('/token/:token', authController.refresh);

module.exports = router;