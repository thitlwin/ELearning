import 'package:elearning/app/data/model/response/ThorResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/LoginRepository.dart';
import 'package:elearning/app/data/repository/OTPVerificationRepository.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/otp_verification/OTPVerificationDialogForPassword.dart';
import 'package:elearning/app/utils/StringUtil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final _otpRepository =
      OTPVerificationRepository(apiClient: MyApiGetConnect());

  final LoginRepository repository;
  ForgotPasswordController({required this.repository});

  var passwordVisible = false.obs;
  var emailAddress;

  Future<void> requestOtpCode(emailAddress) async {
    try {
      EasyLoading.show(status: "Requesting...");
      ThorResponse response = await _otpRepository.requestOtpCode(emailAddress);
      if (response.responseCode == '1') {
        EasyLoading.dismiss();
        Get.defaultDialog(
            barrierDismissible: false,
            title: "",
            content: otpVerificationDialogForPassword(emailAddress));
      } else {
        EasyLoading.showError(response.responseMessage.toString());
      }
    } catch (e) {
      EasyLoading.showError(unknownErrorMessage);
    }
  }

  Future<void> submitOTPCodeFromPasswordForgot(String otpCode) async {
    EasyLoading.show(status: 'Processing...');
    try {
      var response =
          await _otpRepository.requestNewPassword(emailAddress, otpCode);
      if (response.responseCode == '1') {
        EasyLoading.dismiss();
        Get.offAllNamed(Routes.PASSWORD_REQUEST_SUCCESS);
      } else {
        EasyLoading.showError(response.responseMessage.toString());
      }
    } catch (e) {
      EasyLoading.showError(unknownErrorMessage);
    }
  }

  // Future<void> requestPassword(emailAddress) async {
  //   try {
  //     EasyLoading.show(status: "Sending...");
  //     ThorResponse response = await repository.requestPassword(emailAddress);
  //     if (response.responseCode == '1') {
  //       EasyLoading.dismiss();
  //       Get.offAndToNamed(Routes.PASSWORD_REQUEST_SUCCESS);
  //     } else {
  //       EasyLoading.showError(response.responseMessage.toString());
  //     }
  //   } catch (e) {
  //     EasyLoading.showError(unknownErrorMessage);
  //   }
  // }
}
