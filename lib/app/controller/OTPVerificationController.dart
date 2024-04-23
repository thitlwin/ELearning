import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/repository/OTPVerificationRepository.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/utils/Common.dart';
import 'package:elearning/app/utils/StringUtil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  final OTPVerificationRepository repository;
  OTPVerificationController({required this.repository});
  var isOtpRequired = false.obs;

  final _email = ''.obs;
  get email => this._email.value;
  set email(value) => this._email.value = value;
  final AppPref _appPref = Get.find();
  @override
  void onInit() {
    if (Get.arguments != null) email = Get.arguments;
    super.onInit();
  }

  Future<void> makeOtpRequest(email) async {
    EasyLoading.show(status: 'Processing...');
    if (email != null) {
      try {
        var response = await repository.requestOtpCode(email);
        if (response.responseCode == '1') {
          EasyLoading.showSuccess("${response.responseMessage}");
        } else {
          EasyLoading.showError(response.responseMessage.toString());
        }
      } catch (e) {
        EasyLoading.showError(unknownErrorMessage);
      }
    }
  }

  Future<void> submitOTPCode(String otpCode) async {
    EasyLoading.show(status: 'Processing...');
    try {
      var response = await repository.submitVerificationCode(email, otpCode);
      if (response!.responseCode == '1') {
        Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
        saveUserInfoToPref(response.user!, _appPref);
        EasyLoading.showSuccess("Verification success");
      } else {
        EasyLoading.showError(response.responseMessage.toString());
      }
    } catch (e) {
      EasyLoading.showError(unknownErrorMessage);
    }
  }
}
