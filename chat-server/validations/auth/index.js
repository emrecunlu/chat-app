const joi = require('joi');

const registerValidation = joi.object({
   email: joi.string().email().required(),
   userName: joi.string().min(3).max(25).required(),
   password: joi.string().min(6).max(50).required()
});

const loginValidation = joi.object({
   email: joi.string().email().required(),
   password: joi.string().min(6).max(50).required()
})

module.exports = {
   registerValidation,
   loginValidation
};