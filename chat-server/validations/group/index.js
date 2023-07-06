const joi = require('joi');

const createGroupValidation = joi.object({
   title: joi.string().min(3).max(50).required(),
});

module.exports = {
   createGroupValidation,
}