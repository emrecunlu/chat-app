const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

const add = async (data) => await prisma.message.create({
   data, include: {
      user: true,
   },
});

const getByGroupId = async (id) => await prisma.message.findMany({ where: { groupId: id }, include: { user: true }, })

module.exports = {
   add,
   getByGroupId,
};