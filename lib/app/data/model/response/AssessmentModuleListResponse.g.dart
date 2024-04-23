// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssessmentModuleListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentModuleListResponse _$AssessmentModuleListResponseFromJson(
    Map<String, dynamic> json) {
  return AssessmentModuleListResponse(
    moduleLists: (json['moduleLists'] as List<dynamic>)
        .map((e) => AssessmentModule.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$AssessmentModuleListResponseToJson(
        AssessmentModuleListResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'moduleLists': instance.moduleLists,
    };
