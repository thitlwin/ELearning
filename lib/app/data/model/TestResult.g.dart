// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestResult _$TestResultFromJson(Map<String, dynamic> json) {
  return TestResult(
    testName: json['testName'] as String?,
    isPass: json['isPass'] as bool?,
    correctAnswerCount: json['correctAnswerCount'] as int?,
    totalQuestionCount: json['totalQuestionCount'] as int?,
    incorrectAnswerCount: json['incorrectAnswerCount'] as int?,
    incorrectAnswer: (json['questionLists'] as List<dynamic>?)
        ?.map((e) => AssessmentQuestion.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TestResultToJson(TestResult instance) =>
    <String, dynamic>{
      'testName': instance.testName,
      'isPass': instance.isPass,
      'correctAnswerCount': instance.correctAnswerCount,
      'totalQuestionCount': instance.totalQuestionCount,
      'incorrectAnswerCount': instance.incorrectAnswerCount,
      'questionLists': instance.incorrectAnswer,
    };
