// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestResultResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestResultResponse _$TestResultResponseFromJson(Map<String, dynamic> json) {
  return TestResultResponse(
    testResult: json['testResult'] == null
        ? null
        : TestResult.fromJson(json['testResult'] as Map<String, dynamic>),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$TestResultResponseToJson(TestResultResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'testResult': instance.testResult,
    };
