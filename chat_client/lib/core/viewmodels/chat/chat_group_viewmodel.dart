import 'package:chat_client/core/base/base_viewmodel.dart';
import 'package:chat_client/core/models/chat/group/group_model.dart';
import 'package:chat_client/core/repositories/chat/group/group_repository.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/form_helper.dart';

class ChatGroupViewModel extends BaseViewModel {
  final FormHelper form = FormHelper({"title"});
  final GroupRepository _groupRepository = locator<GroupRepository>();
  List<GroupModel> _groups = [];

  List<GroupModel> get groups => _groups;

  Future<void> getGroups() async {
    var result = await _groupRepository.getAll();

    if (!result.success) return;

    _groups = result.data!;
    notifyListeners();
  }

  Future<void> createGroup() async {
    final json = form.toJson();

    var result = await _groupRepository.add(json["title"]);

    if (!result.success) ;
    _groups.insert(0, result.data!);
    form.resetForm();
    NavigationService.back();
    notifyListeners();
  }
}
