import 'package:json_annotation/json_annotation.dart';

part 'ThorResponse.g.dart';

@JsonSerializable()
class ThorResponse {
  String? responseCode;
  String? responseMessage;

  ThorResponse({this.responseCode, this.responseMessage});

  factory ThorResponse.fromJson(Map<String, dynamic> json) =>
      _$ThorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThorResponseToJson(this);
}
