import 'package:elearning/app/controller/NotificationController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/NotificationRepository.dart';
import 'package:get/get.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppPref());
    Get.lazyPut<NotificationController>(() => NotificationController(
        repository: NotificationRepository(apiClient: MyApiGetConnect())));
  }
}
