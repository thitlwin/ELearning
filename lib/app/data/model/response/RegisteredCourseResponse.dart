import 'package:elearning/app/data/model/Course.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RegisteredCourseResponse.g.dart';

@JsonSerializable()
class RegisteredCourseResponse extends ElearningResponse {
  @JsonKey(name: "courseLists")
  List<Course> registeredCourse;

  RegisteredCourseResponse({required this.registeredCourse});

  factory RegisteredCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisteredCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisteredCourseResponseToJson(this);
}
