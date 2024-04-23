import 'package:elearning/app/data/model/Course.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CourseListResponse.g.dart';

@JsonSerializable()
class CourseListResponse extends ElearningResponse {
  @JsonKey(name: "courseLists")
  List<Course> courses;

  CourseListResponse({required this.courses});

  factory CourseListResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseListResponseToJson(this);
}
