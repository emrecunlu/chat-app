const ErrorResult = require("../models/ErrorResult")

const errorHandler = (err, req, res, next) => {
   if (err instanceof ErrorResult) {
      return res.status(err.status).send({ success: false, message: err.message });
   }

   return res.status(500).send({ success: false, message: err?.message ?? "Hata meydana geldi!" });
}

module.exports = errorHandler;