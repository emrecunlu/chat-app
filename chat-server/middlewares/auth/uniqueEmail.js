const ErrorResult = require('../../models/ErrorResult');
const userService = require('../../services/user');

const uniqueEmail = async (req, res, next) => {
   const user = await userService.getByEmail(req.body.email);

   if (user) {
      return next(new ErrorResult("Zaten böyle bir e-posta kayıtlı!", 400));
   }

   next();
}

module.exports = uniqueEmail;