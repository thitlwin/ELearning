import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Course.g.dart';

@JsonSerializable()
class Course extends Equatable {
  final int? courseId;
  final String? courseName;
  final String? courseCode;
  double? coursePercentage;
  double? slidesPercentage;
  double? assessmentPercentage;

  Course({
    this.courseId,
    this.courseName,
    this.courseCode,
    this.coursePercentage,
    this.slidesPercentage,
    this.assessmentPercentage,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  List<Object?> get props => [
        this.courseId,
        this.courseName,
        this.courseCode,
        this.coursePercentage,
        this.slidesPercentage,
        this.assessmentPercentage,
      ];
}
