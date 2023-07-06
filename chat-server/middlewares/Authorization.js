const ErrorResult = require("../models/ErrorResult");
const jwt = require('jsonwebtoken');
const userService = require('../services//user');

const Authorization = (req, res, next) => {
    const bearerToken = req.headers["authorization"] && req.headers["authorization"].split(" ")[1];

    if (!bearerToken) return next(new ErrorResult("Authorization hatası!", 401));

    jwt.verify(bearerToken, process.env.ACCESS_TOKEN_KEY, async (err, user) => {
        if (err) return next(new ErrorResult("Authorization hatası!", 401));

        const credentials = await userService.get(user?.id ?? "");

        if (!credentials) return next(new ErrorResult("Geçersiz access token!", 403));

        req.user = credentials;

        next();
    });
}

module.exports = Authorization