// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssessmentModule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentModule _$AssessmentModuleFromJson(Map<String, dynamic> json) {
  return AssessmentModule(
    testId: json['testId'] as int?,
    employeeId: json['employeeId'] as String?,
    courseId: json['courseId'] as String?,
    courseModuleId: json['courseModuleId'] as int?,
    moduleName: json['moduleName'] as String?,
    isPassed: json['isPassed'] as bool?,
    maxAttempts: json['maxAttempts'] as int?,
    status: json['status'] as String?,
    attemptCount: json['attemptCount'] as int?,
    allowedTime: json['allowedTime'] as String?,
  );
}

Map<String, dynamic> _$AssessmentModuleToJson(AssessmentModule instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'employeeId': instance.employeeId,
      'courseId': instance.courseId,
      'courseModuleId': instance.courseModuleId,
      'moduleName': instance.moduleName,
      'isPassed': instance.isPassed,
      'maxAttempts': instance.maxAttempts,
      'status': instance.status,
      'attemptCount': instance.attemptCount,
      'allowedTime': instance.allowedTime,
    };
