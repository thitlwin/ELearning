import 'package:elearning/app/data/model/Notification.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'NotificationResponse.g.dart';

@JsonSerializable()
class NotificationResponse extends ElearningResponse {
  @JsonKey(name: "notification")
  final List<Notification> notificationList;

  NotificationResponse({required this.notificationList});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
