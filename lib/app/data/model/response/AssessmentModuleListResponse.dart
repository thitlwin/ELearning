import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AssessmentModuleListResponse.g.dart';

@JsonSerializable()
class AssessmentModuleListResponse extends ElearningResponse {
  @JsonKey(name: "moduleLists")
  List<AssessmentModule> moduleLists;

  AssessmentModuleListResponse({required this.moduleLists});

  factory AssessmentModuleListResponse.fromJson(Map<String, dynamic> json) =>
      _$AssessmentModuleListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentModuleListResponseToJson(this);
}
