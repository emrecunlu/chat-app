const joi = require('joi');
const ErrorResult = require('../models/ErrorResult');

const Validator = (schema) => {
   return async function (req, res, next) {
      const { error, value } = schema.validate(req.body);

      if (error) {
         return next(new ErrorResult(error.message, 400));
      }

      req.body = value;

      next();
   }
}

module.exports = Validator;