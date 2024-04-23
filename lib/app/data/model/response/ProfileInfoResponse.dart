import 'package:elearning/app/data/model/ProfileInfo.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProfileInfoResponse.g.dart';

@JsonSerializable()
class ProfileInfoResponse extends ElearningResponse {
  @JsonKey(name: "profile")
  ProfileInfo profileInfo;

  ProfileInfoResponse({required this.profileInfo});

  factory ProfileInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileInfoResponseToJson(this);
}
