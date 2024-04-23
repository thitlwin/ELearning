// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModuleListDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleListDetailResponse _$ModuleListDetailResponseFromJson(
    Map<String, dynamic> json) {
  return ModuleListDetailResponse(
    moduleDetail:
        ModuleDetail.fromJson(json['moduleDetail'] as Map<String, dynamic>),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$ModuleListDetailResponseToJson(
        ModuleListDetailResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'moduleDetail': instance.moduleDetail,
    };
