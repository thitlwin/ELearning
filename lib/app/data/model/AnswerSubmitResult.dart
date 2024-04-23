import 'package:json_annotation/json_annotation.dart';

part 'AnswerSubmitResult.g.dart';

@JsonSerializable()
class AnswerSubmitResult {
  @JsonKey(name: "isPassed")
  final bool? isPassed;
  @JsonKey(name: "finalScoreGrade")
  final int? finalScoreGrade;
  @JsonKey(name: "attemptsRemaining")
  final int? attemptsRemaining;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "assessmentPercentage")
  double? assessmentPercentage;
  @JsonKey(name: "coursePercentage")
  double? coursePercentage;

  factory AnswerSubmitResult.fromJson(Map<String, dynamic> json) =>
      _$AnswerSubmitResultFromJson(json);

  AnswerSubmitResult({
    this.isPassed,
    this.finalScoreGrade,
    this.attemptsRemaining,
    this.status,
    this.assessmentPercentage,
    this.coursePercentage,
  });

  Map<String, dynamic> toJson() => _$AnswerSubmitResultToJson(this);
}
