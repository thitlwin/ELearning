// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModuleCompletionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleCompletionResponse _$ModuleCompletionResponseFromJson(
    Map<String, dynamic> json) {
  return ModuleCompletionResponse(
    status: json['status'] as String?,
    slidesPercentage: (json['slidesPercentage'] as num?)?.toDouble(),
    coursePercentage: (json['coursePercentage'] as num?)?.toDouble(),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$ModuleCompletionResponseToJson(
        ModuleCompletionResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'status': instance.status,
      'slidesPercentage': instance.slidesPercentage,
      'coursePercentage': instance.coursePercentage,
    };
