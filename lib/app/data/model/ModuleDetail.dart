import 'package:elearning/app/data/model/Photo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModuleDetail.g.dart';

@JsonSerializable()
class ModuleDetail {
  final String courseId;
  final String? moduleId;
  final int? moduleNo;
  final int? learningModeId;
  final String? learningModeName;
  final String? courseName;
  final String? moduleName;
  final String? moduleDescription;
  final String? embedCode;
  final String? htmlText;
  final String? fileName;
  final String? contentType;
  final String? base64StringFileData;
  final List<Photo>? imageList;
  // ignore: non_constant_identifier_names
  final String? file_url; //file_url
  final String? testId;
  final String? testName;
  final String? passingGrade;
  final int? maxAttempts;

  ModuleDetail(
      this.courseId,
      this.moduleId,
      this.moduleNo,
      this.learningModeId,
      this.learningModeName,
      this.courseName,
      this.moduleName,
      this.moduleDescription,
      this.embedCode,
      this.htmlText,
      this.fileName,
      this.contentType,
      this.base64StringFileData,
      this.imageList,
      this.file_url,
      this.testId,
      this.testName,
      this.passingGrade,
      this.maxAttempts);

  factory ModuleDetail.fromJson(Map<String, dynamic> json) =>
      _$ModuleDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleDetailToJson(this);
}
