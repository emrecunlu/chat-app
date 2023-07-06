import 'package:chat_client/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_model.g.dart';

@JsonSerializable()
class GroupModel extends BaseModel<GroupModel> {
  int id;
  String title;
  String creative;
  String createdAt;

  GroupModel({
    this.id = 0,
    this.title = "",
    this.creative = "",
    this.createdAt = "",
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => _$GroupModelFromJson(json);

  @override
  GroupModel fromJson(Map<String, dynamic> json) => _$GroupModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GroupModelToJson(this);
}
