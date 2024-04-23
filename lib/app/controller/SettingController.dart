import 'package:elearning/app/data/AppPref.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  var notiIsSwitched = false.obs;
  var soundIsSwitched = false.obs;
  AppPref _appPref = Get.find();
  @override
  void onInit() {
    notiIsSwitched.value = _appPref.displayNotification.val;
    soundIsSwitched.value = _appPref.playNotiSound.val;
    super.onInit();
  }
}
