// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssessmentAnswer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentAnswer _$AssessmentAnswerFromJson(Map<String, dynamic> json) {
  return AssessmentAnswer(
    answerNo: json['answerNo'] as String?,
    answerId: json['answerId'] as int?,
    answerText: json['answerText'] as String?,
    isCorrectAnswer: json['isCorrectAnswer'] as bool?,
  );
}

Map<String, dynamic> _$AssessmentAnswerToJson(AssessmentAnswer instance) =>
    <String, dynamic>{
      'answerNo': instance.answerNo,
      'answerId': instance.answerId,
      'answerText': instance.answerText,
      'isCorrectAnswer': instance.isCorrectAnswer,
    };
