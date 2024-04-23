import 'package:json_annotation/json_annotation.dart';
part 'AssessmentModule.g.dart';

@JsonSerializable()
class AssessmentModule {
  int? testId;
  String? employeeId;
  String? courseId;
  int? courseModuleId;
  String? moduleName;
  bool? isPassed;
  int? maxAttempts;
  String? status;
  int? attemptCount;
  String? allowedTime;

  AssessmentModule({
    this.testId,
    this.employeeId,
    this.courseId,
    this.courseModuleId,
    this.moduleName,
    this.isPassed,
    this.maxAttempts,
    this.status,
    this.attemptCount,
    this.allowedTime,
  });

  factory AssessmentModule.fromJson(Map<String, dynamic> json) =>
      _$AssessmentModuleFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentModuleToJson(this);
}
