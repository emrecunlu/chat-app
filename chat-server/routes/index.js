const express = require('express');
const authRoutes = require('./auth');
const messageRoutes = require('./message');
const groupRoutes = require('./group');
const userRoutes = require('./user');
const Authorization = require('../middlewares/Authorization');

const router = express.Router();


router.use('/auth', authRoutes);
router.use('/message', Authorization, messageRoutes);
router.use('/group', Authorization, groupRoutes);
router.use('/user', Authorization, userRoutes);

module.exports = router;