import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Notification.g.dart';

@JsonSerializable()
class Notification extends Equatable {
  final int? id, notificationType;
  final String? description;

  Notification({this.id, this.notificationType, this.description});

  @override
  List<Object?> get props => [this.id, this.notificationType, this.description];

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
