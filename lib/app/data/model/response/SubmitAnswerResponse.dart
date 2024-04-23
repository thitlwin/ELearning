import 'package:elearning/app/data/model/AnswerSubmitResult.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SubmitAnswerResponse.g.dart';

@JsonSerializable()
class SubmitAnswerResponse extends ElearningResponse {
  @JsonKey(name: "result")
  AnswerSubmitResult? answerResult;

  SubmitAnswerResponse({this.answerResult});

  factory SubmitAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitAnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitAnswerResponseToJson(this);
}
