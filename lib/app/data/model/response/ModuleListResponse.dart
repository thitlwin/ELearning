import 'package:elearning/app/data/model/Module.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModuleListResponse.g.dart';

@JsonSerializable()
class ModuleListResponse extends ElearningResponse {
  @JsonKey(name: "moduleLists")
  List<Module> modules;

  ModuleListResponse({required this.modules});

  factory ModuleListResponse.fromJson(Map<String, dynamic> json) =>
      _$ModuleListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleListResponseToJson(this);
}
