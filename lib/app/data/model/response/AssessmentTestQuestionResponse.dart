import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/data/model/AssessmentQuestion.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AssessmentTestQuestionResponse.g.dart';

@JsonSerializable()
class AssessmentTestQuestionResponse extends ElearningResponse {
  @JsonKey(name: "questionLists")
  List<AssessmentQuestion> questionLists;

  AssessmentTestQuestionResponse({required this.questionLists});

  factory AssessmentTestQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$AssessmentTestQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentTestQuestionResponseToJson(this);
}
