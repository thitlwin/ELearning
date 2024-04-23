// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseListResponse _$CourseListResponseFromJson(Map<String, dynamic> json) {
  return CourseListResponse(
    courses: (json['courseLists'] as List<dynamic>)
        .map((e) => Course.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$CourseListResponseToJson(CourseListResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'courseLists': instance.courses,
    };
