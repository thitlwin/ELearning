import 'package:json_annotation/json_annotation.dart';

part 'ElearningResponse.g.dart';

@JsonSerializable()
class ElearningResponse {
  String? responseCode;
  String? responseMessage;

  ElearningResponse({this.responseCode, this.responseMessage});

  factory ElearningResponse.fromJson(Map<String, dynamic> json) =>
      _$ElearningResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ElearningResponseToJson(this);
}
