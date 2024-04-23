// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssessmentTestQuestionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssessmentTestQuestionResponse _$AssessmentTestQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return AssessmentTestQuestionResponse(
    questionLists: (json['questionLists'] as List<dynamic>)
        .map((e) => AssessmentQuestion.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$AssessmentTestQuestionResponseToJson(
        AssessmentTestQuestionResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'questionLists': instance.questionLists,
    };
