// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnswerListRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerListRequest _$AnswerListRequestFromJson(Map<String, dynamic> json) {
  return AnswerListRequest(
    dataList: (json['dataList'] as List<dynamic>)
        .map((e) => AssessmentQuestion.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AnswerListRequestToJson(AnswerListRequest instance) =>
    <String, dynamic>{
      'dataList': instance.dataList,
    };
