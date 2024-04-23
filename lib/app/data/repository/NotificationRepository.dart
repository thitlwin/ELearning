import 'package:elearning/app/data/model/response/NotificationResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class NotificationRepository {
  final MyApiGetConnect apiClient;

  NotificationRepository({required this.apiClient});

  Future<NotificationResponse?> getAll(int employeeId) {
    return apiClient.getNotificationList(employeeId: employeeId);
  }
}
