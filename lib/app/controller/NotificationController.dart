import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/Notification.dart';
import 'package:elearning/app/data/repository/NotificationRepository.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final NotificationRepository repository;
  NotificationController({required this.repository});

  final notificationlist = RxList<Notification>([]);
  final AppPref _appPref = Get.find<AppPref>();
  @override
  void onInit() {
    if (_appPref.displayNotification.val) {
      // load notification message
      final employeeId = _appPref.employeeId.val;
      repository.getAll(employeeId).then((value) {
        if (value!.responseCode.toString() == "1") {
          notificationlist.value = value.notificationList;
          if (notificationlist.length > 0) playNotificationSound();
        }
      });
    }
    super.onInit();
  }

  void playNotificationSound() {
    // play notification sound
    if (_appPref.playNotiSound.val) {
      FlutterRingtonePlayer.play(
        android: AndroidSounds.notification,
        ios: IosSounds.glass,
        looping: false, // Android only - API >= 28
        volume: 0.1, // Android only - API >= 28
        asAlarm: false, // Android only - all APIs
      );
    }
  }
}
