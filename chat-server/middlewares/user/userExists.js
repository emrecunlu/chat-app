const ErrorResult = require('../../models/ErrorResult');
const userService = require('../../services/user');

const userExists = async (req, res, next) => {
   const user = await userService.get(req.body.userId);

   if (!user) {
      return next(new ErrorResult("Böyle bir kullanıcı bulunamadı", 400));
   }

   next();
}

module.exports = userExists;