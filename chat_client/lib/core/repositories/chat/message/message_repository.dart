import 'package:chat_client/core/models/chat/message/dto/message_create_dto.dart';
import 'package:chat_client/core/models/chat/message/message_model.dart';
import 'package:chat_client/core/models/common/api_results/api_post_get_list_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_object_result.dart';
import 'package:chat_client/core/services/api_service.dart';
import 'package:chat_client/locator.dart';

abstract class IMessageRepository {
  Future<ApiPostObjectResult<MessageModel>> add(MessageCreateDto model);
  Future<ApiGetListResult<MessageModel>> getAll(int groupId);
}

class MessageRepository implements IMessageRepository {
  final ApiService _apiService = locator<ApiService>();

  @override
  Future<ApiPostObjectResult<MessageModel>> add(MessageCreateDto model) async => await _apiService
      .postReturnObject<MessageModel>("/message/add", model.toJson(), MessageModel());

  @override
  Future<ApiGetListResult<MessageModel>> getAll(int groupId) async =>
      await _apiService.getList<MessageModel>('/message/group/$groupId', MessageModel());
}
