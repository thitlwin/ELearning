// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModuleListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleListResponse _$ModuleListResponseFromJson(Map<String, dynamic> json) {
  return ModuleListResponse(
    modules: (json['moduleLists'] as List<dynamic>)
        .map((e) => Module.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$ModuleListResponseToJson(ModuleListResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'moduleLists': instance.modules,
    };
