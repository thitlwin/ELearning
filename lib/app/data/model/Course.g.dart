// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    courseId: json['courseId'] as int?,
    courseName: json['courseName'] as String?,
    courseCode: json['courseCode'] as String?,
    coursePercentage: (json['coursePercentage'] as num?)?.toDouble(),
    slidesPercentage: (json['slidesPercentage'] as num?)?.toDouble(),
    assessmentPercentage: (json['assessmentPercentage'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'courseName': instance.courseName,
      'courseCode': instance.courseCode,
      'coursePercentage': instance.coursePercentage,
      'slidesPercentage': instance.slidesPercentage,
      'assessmentPercentage': instance.assessmentPercentage,
    };
