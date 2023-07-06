const userService = require('../../services/user')
const fs = require('fs');
const path = require('path');
const ErrorResult = require('../../models/ErrorResult');

const uploadAvatar = async (req, res, next) => {
   const filePath = path.join(__dirname, '../../images/avatar', req.user.userName + '.webp');
   const downloadUrl = process.env.SERVER_URL + '/images/avatar/' + req.user.userName + '.webp';

   fs.writeFile(filePath, req.image, (err) => {
      if (err) {
         return next(new ErrorResult("Resim yükleme hatası!", 400))
      }
   })

   const user = await userService.updateAvatarUrl(req.user.id, downloadUrl)

   res.status(200).send({ success: true, message: "Avatar başarıyla güncellendi.", data: user.avatarUrl });
}

module.exports = {
   uploadAvatar,
}