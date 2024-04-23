import 'package:json_annotation/json_annotation.dart';

part 'Photo.g.dart';

@JsonSerializable()
class Photo {
  final int? slideNo;
  final String? slideName;
  // ignore: non_constant_identifier_names
  final String? file_url;
  final String? comments;

  Photo(this.slideNo, this.slideName, this.file_url, this.comments);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
