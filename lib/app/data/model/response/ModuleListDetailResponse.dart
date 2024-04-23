import 'package:elearning/app/data/model/ModuleDetail.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModuleListDetailResponse.g.dart';

@JsonSerializable()
class ModuleListDetailResponse extends ElearningResponse {
  @JsonKey(name: "moduleDetail")
  ModuleDetail moduleDetail;

  ModuleListDetailResponse({required this.moduleDetail});

  factory ModuleListDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ModuleListDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleListDetailResponseToJson(this);
}
