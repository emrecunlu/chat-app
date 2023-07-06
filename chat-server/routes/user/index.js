const express = require('express');
const userController = require('../../controllers/user');
const ImageControl = require('../../middlewares/ImageControl');

const router = express.Router();

router.post('/upload-avatar', ImageControl("file"), userController.uploadAvatar);

module.exports = router;

