import 'package:elearning/app/controller/OTPVerificationController.dart';
import 'package:elearning/app/controller/RegistrationController.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/OTPVerificationRepository.dart';
import 'package:elearning/app/data/repository/RegisterationRepository.dart';
import 'package:get/get.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController(
        repository: RegisterationRepository(apiClient: MyApiGetConnect())));
    Get.lazyPut<OTPVerificationController>(() => OTPVerificationController(
        repository: OTPVerificationRepository(apiClient: MyApiGetConnect())));
    //  LoginRepository(MyApiGetConnect())));
  }
}
