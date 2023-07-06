const ErrorResult = require('../../models/ErrorResult');
const userService = require('../../services/user');
const jwt = require('jsonwebtoken');

const refreshTokens = [];

const register = async (req, res) => {
    await userService.add(req.body);

    res.status(200).send({ success: true, message: "Kullanıcı kaydı başarılı." });
}

const login = async (req, res, next) => {
    const user = await userService.getByEmailAndPassword(req.body.email, req.body.password);

    if (!user) {
        return next(new ErrorResult("E-posta adresi veya şifre hatalı!", 400));
    }

    const accessToken = jwt.sign({
        id: user.id,
        displayName: user.displayName,
        email: user.email,
        avatarUrl: user.avatarUrl
    }, process.env.ACCESS_TOKEN_KEY ?? "", { expiresIn: process.env.ACCESS_TOKEN_TIME });
    const refreshToken = jwt.sign({ id: user.id }, process.env.REFRESH_TOKEN_KEY ?? "", { expiresIn: process.env.REFRESH_TOKEN_TIME });
    refreshTokens.push(refreshToken);

    res.status(200).send({
        success: true, data: {
            accessToken,
            refreshToken
        },
    })
}

const refresh = async (req, res, next) => {
    const { token: refreshToken } = req.params;

    jwt.verify(refreshToken, process.env.REFRESH_TOKEN_KEY, (err, user) => {
        if (err) return next(new ErrorResult("Yetki hatası!", 403));

        const accessToken = jwt.sign({
            id: user.id,
            displayName: user.displayName,
            email: user.email,
            avatarUrl: user.avatarUrl
        }, process.env.ACCESS_TOKEN_KEY, { expiresIn: process.env.ACCESS_TOKEN_TIME });

        return res.status(200).send({ success: true, data: accessToken });
    });
}

module.exports = {
    register,
    login,
    refresh
}