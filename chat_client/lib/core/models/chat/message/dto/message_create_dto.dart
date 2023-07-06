import 'package:json_annotation/json_annotation.dart';

part 'message_create_dto.g.dart';

@JsonSerializable()
class MessageCreateDto {
  final String message;
  final int groupId;

  MessageCreateDto({required this.message, required this.groupId});

  factory MessageCreateDto.fromJson(Map<String, dynamic> json) => _$MessageCreateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageCreateDtoToJson(this);
}
