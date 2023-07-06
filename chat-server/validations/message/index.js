const joi = require('joi');

const createMessageValidation = joi.object({
   message: joi.string().required(),
   groupId: joi.number().required(),
});

module.exports = {
   createMessageValidation
}