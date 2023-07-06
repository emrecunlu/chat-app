// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => GroupModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      creative: json['creative'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
    );

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'creative': instance.creative,
      'createdAt': instance.createdAt,
    };
