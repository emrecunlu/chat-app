import 'package:chat_client/core/models/chat/group/group_model.dart';
import 'package:chat_client/core/models/common/api_results/api_post_get_list_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_object_result.dart';
import 'package:chat_client/core/services/api_service.dart';
import 'package:chat_client/locator.dart';

abstract class IGroupRepository {
  Future<ApiGetListResult<GroupModel>> getAll();
  Future<ApiPostObjectResult<GroupModel>> add(String title);
}

class GroupRepository implements IGroupRepository {
  final ApiService _apiService = locator<ApiService>();

  @override
  Future<ApiGetListResult<GroupModel>> getAll() async =>
      await _apiService.getList("/group", GroupModel());

  @override
  Future<ApiPostObjectResult<GroupModel>> add(String title) async =>
      await _apiService.postReturnObject<GroupModel>("/group/add", {"title": title}, GroupModel());
}
