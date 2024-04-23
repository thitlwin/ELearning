// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ElearningResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElearningResponse _$ElearningResponseFromJson(Map<String, dynamic> json) {
  return ElearningResponse(
    responseCode: json['responseCode'] as String?,
    responseMessage: json['responseMessage'] as String?,
  );
}

Map<String, dynamic> _$ElearningResponseToJson(ElearningResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
    };
