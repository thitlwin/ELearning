import 'package:json_annotation/json_annotation.dart';
part 'UpdateProfileRequest.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  @JsonKey(name: "employeeId")
  final int employeeId;

  @JsonKey(name: "contactMobile")
  final String contactMobile;

  @JsonKey(name: "address")
  final String address;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  UpdateProfileRequest({
    required this.employeeId,
    required this.contactMobile,
    required this.address,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
