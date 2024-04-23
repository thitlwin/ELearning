import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Company.g.dart';

@JsonSerializable()
class Company extends Equatable {
  late final String? companyId;
  late final String? companyName;

  Company({this.companyId, this.companyName});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  List<Object?> get props => [companyId, companyName];
}
