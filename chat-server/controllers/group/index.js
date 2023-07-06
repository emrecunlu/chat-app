const groupService = require('../../services/group');

const add = async (req, res) => {
   console.log(req.user);

   const group = await groupService.add({
      userId: req.user.id,
      ...req.body,
   });

   res.status(200).send({
      success: true,
      message: "Grup başarıyla oluşturuldu.",
      data: {
         id: group.id,
         title: group.title,
         createdAt: group.createdAt,
         creative: group.user.userName,
      }
   });
}

const getAll = async (req, res) => {
   const groups = await groupService.getAll();

   res.status(200).send({
      success: true,
      data: groups.map(group => ({
         id: group.id,
         title: group.title,
         createdAt: group.createdAt,
         creative: group.user.userName,
      }))
   })
}

module.exports = {
   add,
   getAll,
}