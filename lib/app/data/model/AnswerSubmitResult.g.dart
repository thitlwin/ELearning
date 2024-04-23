// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnswerSubmitResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerSubmitResult _$AnswerSubmitResultFromJson(Map<String, dynamic> json) {
  return AnswerSubmitResult(
    isPassed: json['isPassed'] as bool?,
    finalScoreGrade: json['finalScoreGrade'] as int?,
    attemptsRemaining: json['attemptsRemaining'] as int?,
    status: json['status'] as String?,
    assessmentPercentage: (json['assessmentPercentage'] as num?)?.toDouble(),
    coursePercentage: (json['coursePercentage'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$AnswerSubmitResultToJson(AnswerSubmitResult instance) =>
    <String, dynamic>{
      'isPassed': instance.isPassed,
      'finalScoreGrade': instance.finalScoreGrade,
      'attemptsRemaining': instance.attemptsRemaining,
      'status': instance.status,
      'assessmentPercentage': instance.assessmentPercentage,
      'coursePercentage': instance.coursePercentage,
    };
