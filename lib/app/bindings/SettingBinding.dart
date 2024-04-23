import 'package:elearning/app/controller/SettingController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:get/get.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppPref>(() => AppPref());
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
