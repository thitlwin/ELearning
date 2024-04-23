// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    json['slideNo'] as int?,
    json['slideName'] as String?,
    json['file_url'] as String?,
    json['comments'] as String?,
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'slideNo': instance.slideNo,
      'slideName': instance.slideName,
      'file_url': instance.file_url,
      'comments': instance.comments,
    };
