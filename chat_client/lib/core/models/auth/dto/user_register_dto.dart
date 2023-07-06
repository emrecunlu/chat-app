import 'package:json_annotation/json_annotation.dart';

part 'user_register_dto.g.dart';

@JsonSerializable()
class UserRegisterDto {
  final String userName;
  final String email;
  final String password;

  UserRegisterDto({
    required this.userName,
    required this.email,
    required this.password,
  });

  factory UserRegisterDto.fromJson(Map<String, dynamic> json) => _$UserRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterDtoToJson(this);
}
