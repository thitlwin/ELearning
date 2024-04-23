import 'package:json_annotation/json_annotation.dart';

part 'ProfileInfo.g.dart';

@JsonSerializable()
class ProfileInfo {
  @JsonKey(name: "employeeId")
  final int? employeeId;
  @JsonKey(name: "employeeName")
  final String? employeeName;
  @JsonKey(name: "employeeCode")
  final String? employeeCode;
  @JsonKey(name: "contactMobile")
  final String? contactMobile;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "email")
  final String? email;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoFromJson(json);

  ProfileInfo({
    this.employeeId,
    this.employeeName,
    this.employeeCode,
    this.contactMobile,
    this.address,
    this.email,
  });

  Map<String, dynamic> toJson() => _$ProfileInfoToJson(this);
}
