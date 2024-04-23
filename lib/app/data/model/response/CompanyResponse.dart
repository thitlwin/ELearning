import 'package:elearning/app/data/model/Company.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CompanyResponse.g.dart';

@JsonSerializable()
class CompanyResponse extends ElearningResponse {
  @JsonKey(name: "companylist")
  List<Company> companyList;

  CompanyResponse({required this.companyList});

  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyResponseToJson(this);
}
