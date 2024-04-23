// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CompanyResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) {
  return CompanyResponse(
    companyList: (json['companylist'] as List<dynamic>)
        .map((e) => Company.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$CompanyResponseToJson(CompanyResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'companylist': instance.companyList,
    };
