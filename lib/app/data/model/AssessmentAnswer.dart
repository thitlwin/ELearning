import 'package:json_annotation/json_annotation.dart';
part 'AssessmentAnswer.g.dart';

@JsonSerializable()
class AssessmentAnswer {
  String? answerNo;
  int? answerId;
  String? answerText;
  bool? isCorrectAnswer;

  AssessmentAnswer({
    this.answerNo,
    this.answerId,
    this.answerText,
    this.isCorrectAnswer,
  });

  factory AssessmentAnswer.fromJson(Map<String, dynamic> json) =>
      _$AssessmentAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentAnswerToJson(this);
}
