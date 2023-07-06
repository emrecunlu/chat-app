const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

const add = async (data) => await prisma.user.create({ data });
const get = async (id) => await prisma.user.findUnique({ where: { id } });
const getByEmail = async (email) => await prisma.user.findUnique({ where: { email } });
const getByUsername = async (userName) => await prisma.user.findUnique({ where: { userName } });
const getByEmailAndPassword = async (email, password) => await prisma.user.findFirst({ where: { email, password } });
const updateAvatarUrl = async (id, avatarUrl) => await prisma.user.update({
   where: { id }, data: {
      avatarUrl
   }
})

module.exports = { add, getByEmail, getByUsername, getByEmailAndPassword, get, updateAvatarUrl };