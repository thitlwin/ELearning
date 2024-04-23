// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return Module(
    json['courseId'] as String?,
    json['moduleId'] as int?,
    json['moduleName'] as String?,
    json['learningModeId'] as int?,
    json['learningModeName'] as String?,
    json['status'] as String?,
  );
}

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'courseId': instance.courseId,
      'moduleId': instance.moduleId,
      'moduleName': instance.moduleName,
      'learningModeId': instance.learningModeId,
      'learningModeName': instance.learningModeName,
      'status': instance.status,
    };
