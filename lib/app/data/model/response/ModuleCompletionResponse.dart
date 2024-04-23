import 'package:elearning/app/data/model/response/ThorResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModuleCompletionResponse.g.dart';

@JsonSerializable()
class ModuleCompletionResponse extends ThorResponse {
  String? status;
  double? slidesPercentage;
  double? coursePercentage;

  ModuleCompletionResponse(
      {required this.status, this.slidesPercentage, this.coursePercentage});

  factory ModuleCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$ModuleCompletionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleCompletionResponseToJson(this);
}
