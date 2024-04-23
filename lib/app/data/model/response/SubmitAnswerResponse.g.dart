// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubmitAnswerResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitAnswerResponse _$SubmitAnswerResponseFromJson(Map<String, dynamic> json) {
  return SubmitAnswerResponse(
    answerResult: json['result'] == null
        ? null
        : AnswerSubmitResult.fromJson(json['result'] as Map<String, dynamic>),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$SubmitAnswerResponseToJson(
        SubmitAnswerResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'result': instance.answerResult,
    };
