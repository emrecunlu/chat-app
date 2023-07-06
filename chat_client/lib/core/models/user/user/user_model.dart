import 'package:chat_client/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel<UserModel> {
  int id;
  String userName;
  String? displayName;
  String? avatarUrl;
  String email;
  String? createdAt;

  UserModel({
    this.id = 0,
    this.email = "",
    this.userName = "",
    this.displayName,
    this.avatarUrl,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  UserModel fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
