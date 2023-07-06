import 'package:chat_client/core/base/base_model.dart';
import 'package:chat_client/core/models/user/user/user_model.dart';

class MessageModel extends BaseModel<MessageModel> {
  int id;
  int groupId;
  String message;
  String createdAt;
  UserModel? user;

  MessageModel({this.id = 0, this.groupId = 0, this.message = "", this.createdAt = "", this.user});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"],
      groupId: json["groupId"],
      message: json["message"],
      createdAt: json["createdAt"],
      user: UserModel.fromJson(json["user"]),
    );
  }

  @override
  MessageModel fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"],
      groupId: json["groupId"],
      message: json["message"],
      createdAt: json["createdAt"],
      user: UserModel.fromJson(json["user"]),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "groupId": groupId,
        "message": message,
        "createdAt": createdAt,
        "user": user != null ? user!.toJson() : null,
      };
}
