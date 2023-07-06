const messageService = require('../../services/message');

const add = async (req, res) => {

   const message = await messageService.add({
      userId: req.user.id,
      ...req.body,
   });

   res.status(200).send({
      success: true, data: {
         id: message.id,
         groupId: message.groupId,
         message: message.message,
         createdAt: message.createdAt,
         user: {
            id: message.user.id,
            userName: message.user.userName,
            email: message.user.email,
            displayName: message.user.displayName,
            avatarUrl: message.user.avatarUrl,
         }
      },
   })
}

const getByGroup = async (req, res) => {
   const messages = await messageService.getByGroupId(parseInt(req.params.id));

   res.status(200).send({
      success: true, data: messages.map((message) => ({
         id: message.id,
         groupId: message.groupId,
         message: message.message,
         createdAt: message.createdAt,
         user: {
            id: message.user.id,
            userName: message.user.userName,
            email: message.user.email,
            displayName: message.user.displayName,
            avatarUrl: message.user.avatarUrl,
         }
      }))
   });
}


module.exports = {
   add,
   getByGroup
}