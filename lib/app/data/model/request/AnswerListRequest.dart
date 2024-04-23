import 'package:elearning/app/data/model/AnswerList.dart';
import 'package:elearning/app/data/model/AssessmentQuestion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AnswerListRequest.g.dart';

@JsonSerializable()
class AnswerListRequest {
  List<AssessmentQuestion> dataList;

  AnswerListRequest({required this.dataList});

  factory AnswerListRequest.fromJson(Map<String, dynamic> json) =>
      _$AnswerListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerListRequestToJson(this);
}
