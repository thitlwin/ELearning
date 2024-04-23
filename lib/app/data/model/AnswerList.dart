import 'package:json_annotation/json_annotation.dart';
part 'AnswerList.g.dart';

@JsonSerializable()
class AnswerList {
  @JsonKey(name: "testQuestionId")
  int? testQuestionId;
  @JsonKey(name: "testId")
  int? testId;
  @JsonKey(name: "QuestionNo")
  int? questionNo;
  @JsonKey(name: "TestQuestionTypeId")
  int? testQuestionTypeId;
  @JsonKey(name: "AnswerValue")
  int? answerValue;
  @JsonKey(name: "EmployeeId")
  int? employeeId;

  AnswerList({
    this.testQuestionId,
    this.testId,
    this.questionNo,
    this.testQuestionTypeId,
    this.answerValue,
    this.employeeId,
  });

  factory AnswerList.fromJson(Map<String, dynamic> json) =>
      _$AnswerListFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerListToJson(this);
}
