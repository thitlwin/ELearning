// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisteredCourseResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteredCourseResponse _$RegisteredCourseResponseFromJson(
    Map<String, dynamic> json) {
  return RegisteredCourseResponse(
    registeredCourse: (json['courseLists'] as List<dynamic>)
        .map((e) => Course.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$RegisteredCourseResponseToJson(
        RegisteredCourseResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'courseLists': instance.registeredCourse,
    };
