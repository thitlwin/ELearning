import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/request/ChangePasswordRequest.dart';
import 'package:elearning/app/data/repository/LoginRepository.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/AccountVerificationRequiredialog.dart';
import 'package:elearning/app/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AppPref _appPref = Get.find<AppPref>();
  final LoginRepository repository;
  LoginController(this.repository);

  // for change password
  var currentPasswordVisible = true.obs;
  var newPasswordVisible = true.obs;
  var confirmPasswordVisible = true.obs;

  var passwordVisible = true.obs;
  final _currentPassword = ''.obs;
  get currentPassword => this._currentPassword.value;
  set currentPassword(value) => this._currentPassword.value = value;

  final _newPassword = ''.obs;
  get newPassword => this._newPassword.value;
  set newPassword(value) => this._newPassword.value = value;

  final _confirmNewPassword = ''.obs;
  get confirmNewPassword => this._confirmNewPassword.value;
  set confirmNewPassword(value) => this._confirmNewPassword.value = value;

  void doLogin(String email, String password) {
    EasyLoading.show(status: 'Logging in ...');
    repository.doLogin(email, password).then((value) {
      if (value!.responseCode.toString() == "1") {
        EasyLoading.showSuccess("Login Success");
        saveUserInfoToPref(value.user!, _appPref);
        if (value.user!.requireChangePassword) {
          Get.back();
          Get.toNamed(Routes.CHANGE_PASSWORD);
        } else
          Get.offAndToNamed(Routes.BOTTOM_NAVIGATION);
      } else if (value.responseCode.toString() == "2") {
        EasyLoading.dismiss();
        Get.dialog(AccountVerificationRequiredialog(
            value.responseMessage.toString(), email));
      } else {
        EasyLoading.showError(value.responseMessage.toString());
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError("Something wrong.");
    });
  }

  void changePassword() {
    EasyLoading.show(status: 'Loading...');
    var request = ChangePasswordRequest(
        userName: _appPref.email.val,
        newPassword: newPassword,
        oldPassword: currentPassword);
    repository.changePassword(request).then((value) {
      if (value!.responseCode.toString() == "1") {
        debugPrint(
            "_appPref.requireChangePassword.val-----${_appPref.requireChangePassword.val}");
        EasyLoading.showSuccess("You have successfully changed your password.");
        if (_appPref.requireChangePassword.val) {
          Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
        }
      } else {
        EasyLoading.showError(value.responseMessage.toString());
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError("Something wrong.");
    });
  }
}
