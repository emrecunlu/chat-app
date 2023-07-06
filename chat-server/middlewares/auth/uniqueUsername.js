const ErrorResult = require('../../models/ErrorResult');
const userService = require('../../services/user');

const uniqueUsername = async (req, res, next) => {
   const user = await userService.getByUsername(req.body.userName);

   if (user) {
      return next(new ErrorResult("Zaten böyle bir kullanıcı adı kayıtlı!", 400));
   }

   next();
}

module.exports = uniqueUsername;