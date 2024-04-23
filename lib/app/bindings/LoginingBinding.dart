import 'package:elearning/app/controller/LoginController.dart';
import 'package:elearning/app/controller/OTPVerificationController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/LoginRepository.dart';
import 'package:elearning/app/data/repository/OTPVerificationRepository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppPref());
    Get.lazyPut<LoginController>(
        () => LoginController(LoginRepository(MyApiGetConnect())));
    Get.put(Get.put(OTPVerificationController(
        repository: OTPVerificationRepository(apiClient: MyApiGetConnect()))));
  }
}
