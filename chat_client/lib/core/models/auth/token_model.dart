import 'package:chat_client/core/base/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends BaseModel<TokenModel> {
  String accessToken;
  String refreshToken;

  TokenModel({
    this.accessToken = "",
    this.refreshToken = "",
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  @override
  TokenModel fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
