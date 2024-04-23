import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Module.g.dart';

@JsonSerializable()
class Module {
  final String? courseId;
  final int? moduleId;
  final String? moduleName;
  final int? learningModeId;
  final String? learningModeName;
  String? status;

  Module(this.courseId, this.moduleId,this.moduleName,
      this.learningModeId, this.learningModeName, this.status);

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}
