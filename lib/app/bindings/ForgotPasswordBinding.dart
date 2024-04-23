import 'package:elearning/app/controller/ForgotPasswordController.dart';
import 'package:elearning/app/controller/OTPVerificationController.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/LoginRepository.dart';
import 'package:elearning/app/data/repository/OTPVerificationRepository.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(
        repository: LoginRepository(MyApiGetConnect())));

    Get.lazyPut<OTPVerificationController>(() => OTPVerificationController(
        repository: OTPVerificationRepository(apiClient: MyApiGetConnect())));
  }
}
