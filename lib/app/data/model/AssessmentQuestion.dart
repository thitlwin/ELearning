import 'package:elearning/app/data/model/AssessmentAnswer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AssessmentQuestion.g.dart';

@JsonSerializable()
class AssessmentQuestion {
  int? questionNo;
  int? questionId;
  String? questionName;
  int? yourAnswerId;
  String? answerExplanation;
  int? selectedAnswerPosition;
  bool? isAlreadyAnswer = false;
  @JsonKey(name: "answerLists")
  List<AssessmentAnswer>? answerList;

  AssessmentQuestion({
    this.questionNo,
    this.questionId,
    this.questionName,
    this.yourAnswerId,
    this.answerExplanation,
    this.answerList,
    this.selectedAnswerPosition,
    this.isAlreadyAnswer,
  });

  factory AssessmentQuestion.fromJson(Map<String, dynamic> json) =>
      _$AssessmentQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentQuestionToJson(this);
}
