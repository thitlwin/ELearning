import 'package:elearning/app/data/model/AssessmentQuestion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'TestResult.g.dart';

@JsonSerializable()
class TestResult {
  @JsonKey(name: "testName")
  final String? testName;
  @JsonKey(name: "isPass")
  final bool? isPass;
  @JsonKey(name: "correctAnswerCount")
  final int? correctAnswerCount;
  @JsonKey(name: "totalQuestionCount")
  final int? totalQuestionCount;
  @JsonKey(name: "incorrectAnswerCount")
  final int? incorrectAnswerCount;
  @JsonKey(name: "questionLists")
  final List<AssessmentQuestion>? incorrectAnswer;

  factory TestResult.fromJson(Map<String, dynamic> json) =>
      _$TestResultFromJson(json);

  TestResult({
    this.testName,
    this.isPass,
    this.correctAnswerCount,
    this.totalQuestionCount,
    this.incorrectAnswerCount,
    this.incorrectAnswer,
  });

  Map<String, dynamic> toJson() => _$TestResultToJson(this);
}
