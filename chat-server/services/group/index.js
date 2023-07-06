const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient();

const add = async (data) => await prisma.group.create({ data, include: { user: true } });
const get = async (id) => await prisma.group.findUnique({ where: { id } });
const getAll = async () => await prisma.group.findMany({ include: { user: true }, orderBy: { createdAt: "desc" } })

module.exports = {
   add,
   get,
   getAll
}