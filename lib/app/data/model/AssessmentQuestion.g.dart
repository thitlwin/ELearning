// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssessmentQuestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentQuestion _$AssessmentQuestionFromJson(Map<String, dynamic> json) {
  return AssessmentQuestion(
    questionNo: json['questionNo'] as int?,
    questionId: json['questionId'] as int?,
    questionName: json['questionName'] as String?,
    yourAnswerId: json['yourAnswerId'] as int?,
    answerExplanation: json['answerExplanation'] as String?,
    answerList: (json['answerLists'] as List<dynamic>?)
        ?.map((e) => AssessmentAnswer.fromJson(e as Map<String, dynamic>))
        .toList(),
    selectedAnswerPosition: json['selectedAnswerPosition'] as int?,
    isAlreadyAnswer: json['isAlreadyAnswer'] as bool?,
  );
}

Map<String, dynamic> _$AssessmentQuestionToJson(AssessmentQuestion instance) =>
    <String, dynamic>{
      'questionNo': instance.questionNo,
      'questionId': instance.questionId,
      'questionName': instance.questionName,
      'yourAnswerId': instance.yourAnswerId,
      'answerExplanation': instance.answerExplanation,
      'selectedAnswerPosition': instance.selectedAnswerPosition,
      'isAlreadyAnswer': instance.isAlreadyAnswer,
      'answerLists': instance.answerList,
    };
