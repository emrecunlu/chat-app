// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_create_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageCreateDto _$MessageCreateDtoFromJson(Map<String, dynamic> json) =>
    MessageCreateDto(
      message: json['message'] as String,
      groupId: json['groupId'] as int,
    );

Map<String, dynamic> _$MessageCreateDtoToJson(MessageCreateDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'groupId': instance.groupId,
    };
