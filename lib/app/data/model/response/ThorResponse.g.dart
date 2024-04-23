// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ThorResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThorResponse _$ThorResponseFromJson(Map<String, dynamic> json) {
  return ThorResponse(
    responseCode: json['responseCode'] as String?,
    responseMessage: json['responseMessage'] as String?,
  );
}

Map<String, dynamic> _$ThorResponseToJson(ThorResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
    };
