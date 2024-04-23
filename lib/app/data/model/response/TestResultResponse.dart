import 'package:elearning/app/data/model/TestResult.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'TestResultResponse.g.dart';

@JsonSerializable()
class TestResultResponse extends ElearningResponse {
  @JsonKey(name: "testResult")
  TestResult? testResult;

  TestResultResponse({this.testResult});

  factory TestResultResponse.fromJson(Map<String, dynamic> json) =>
      _$TestResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TestResultResponseToJson(this);
}
