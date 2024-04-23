// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnswerList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerList _$AnswerListFromJson(Map<String, dynamic> json) {
  return AnswerList(
    testQuestionId: json['testQuestionId'] as int?,
    testId: json['testId'] as int?,
    questionNo: json['QuestionNo'] as int?,
    testQuestionTypeId: json['TestQuestionTypeId'] as int?,
    answerValue: json['AnswerValue'] as int?,
    employeeId: json['EmployeeId'] as int?,
  );
}

Map<String, dynamic> _$AnswerListToJson(AnswerList instance) =>
    <String, dynamic>{
      'testQuestionId': instance.testQuestionId,
      'testId': instance.testId,
      'QuestionNo': instance.questionNo,
      'TestQuestionTypeId': instance.testQuestionTypeId,
      'AnswerValue': instance.answerValue,
      'EmployeeId': instance.employeeId,
    };
