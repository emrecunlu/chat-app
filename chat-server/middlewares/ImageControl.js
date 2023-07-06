const ErrorResult = require("../models/ErrorResult");
const sharp = require('sharp');

const ImageControl = (key) => async (req, res, next) => {
   const allowedTypes = ["image/png", "image/jpg", "image/jpeg", "image/webp"];

   if (!req.files || req?.files?.length <= 0) {
      return next(new ErrorResult("Lütfen resim seçiniz!", 400));
   }

   if (!Object.keys(req.files).includes(key)) {
      return next(new ErrorResult("Geçersiz dosya hatası!", 400));
   }

   if (!allowedTypes.includes(req.files[key].mimetype)) {
      return next(new ErrorResult("Geçersiz dosya uzantısı!", 400))
   }

   const file = await sharp(req.files[key].data).webp().toBuffer()

   req.image = file;

   next();
}

module.exports = ImageControl;