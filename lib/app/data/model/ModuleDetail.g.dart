// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModuleDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleDetail _$ModuleDetailFromJson(Map<String, dynamic> json) {
  return ModuleDetail(
    json['courseId'] as String,
    json['moduleId'] as String?,
    json['moduleNo'] as int?,
    json['learningModeId'] as int?,
    json['learningModeName'] as String?,
    json['courseName'] as String?,
    json['moduleName'] as String?,
    json['moduleDescription'] as String?,
    json['embedCode'] as String?,
    json['htmlText'] as String?,
    json['fileName'] as String?,
    json['contentType'] as String?,
    json['base64StringFileData'] as String?,
    (json['imageList'] as List<dynamic>?)
        ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['file_url'] as String?,
    json['testId'] as String?,
    json['testName'] as String?,
    json['passingGrade'] as String?,
    json['maxAttempts'] as int?,
  );
}

Map<String, dynamic> _$ModuleDetailToJson(ModuleDetail instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'moduleId': instance.moduleId,
      'moduleNo': instance.moduleNo,
      'learningModeId': instance.learningModeId,
      'learningModeName': instance.learningModeName,
      'courseName': instance.courseName,
      'moduleName': instance.moduleName,
      'moduleDescription': instance.moduleDescription,
      'embedCode': instance.embedCode,
      'htmlText': instance.htmlText,
      'fileName': instance.fileName,
      'contentType': instance.contentType,
      'base64StringFileData': instance.base64StringFileData,
      'imageList': instance.imageList,
      'file_url': instance.file_url,
      'testId': instance.testId,
      'testName': instance.testName,
      'passingGrade': instance.passingGrade,
      'maxAttempts': instance.maxAttempts,
    };
