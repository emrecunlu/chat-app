// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterDto _$UserRegisterDtoFromJson(Map<String, dynamic> json) =>
    UserRegisterDto(
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserRegisterDtoToJson(UserRegisterDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
    };
