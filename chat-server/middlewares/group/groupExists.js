const ErrorResult = require('../../models/ErrorResult');
const groupService = require('../../services/group');

const groupExists = async (req, res, next) => {
   const group = await groupService.get(parseInt(req.body.groupId) || parseInt(req.params.id));

   if (!group) return next(new ErrorResult("Böyle bir grup bulunamadı!", 400));

   next();
}

module.exports = groupExists;