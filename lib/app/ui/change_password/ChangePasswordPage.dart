import 'package:elearning/app/controller/LoginController.dart';
import 'package:elearning/app/ui/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends GetView<LoginController> {
  final _textFieldControllerForCurrentPassord = TextEditingController(text: "");
  final _textFieldControllerForNewPassword = TextEditingController(text: "");
  final _textFieldControllerForConfirmNewPassword =
      TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ForgotPasswordController controller = Get.put(ForgotPasswordController());
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      appBar: AppBar(title: Text('Change Password')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Obx(
                  () => Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      autofocus: false,
                      obscureText: controller.currentPasswordVisible.value,
                      controller: _textFieldControllerForCurrentPassord,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Current password is required.";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Current Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: themeData.colorScheme.primaryVariant,
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 22,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.currentPasswordVisible.value =
                                !controller.currentPasswordVisible.value;
                          },
                          child: Icon(
                            controller.currentPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off_outlined,
                            size: 22,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      // textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      autofocus: false,
                      obscureText: controller.newPasswordVisible.value,
                      controller: _textFieldControllerForNewPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "New password is required.";
                        } else if (value.toString() ==
                            _textFieldControllerForCurrentPassord.text
                                .toString()) {
                          return "New password should not be the old password.";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "New Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: themeData.colorScheme.primaryVariant,
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 22,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.newPasswordVisible.value =
                                !controller.newPasswordVisible.value;
                          },
                          child: Icon(
                            controller.newPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off_outlined,
                            size: 22,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      autofocus: false,
                      obscureText: controller.confirmPasswordVisible.value,
                      controller: _textFieldControllerForConfirmNewPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm password is required.";
                        } else if (value.toString() !=
                            _textFieldControllerForNewPassword.text
                                .toString()) {
                          return "Confirm password does not match.";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Confirm New Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: themeData.colorScheme.primaryVariant,
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 22,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.confirmPasswordVisible.value =
                                !controller.confirmPasswordVisible.value;
                          },
                          child: Icon(
                            controller.confirmPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off_outlined,
                            size: 22,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  child: RoundedButton(
                    key: UniqueKey(),
                    text: "Change",
                    color: themeData.colorScheme.primary,
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (_formKey.currentState!.validate()) {
                        controller.newPassword =
                            _textFieldControllerForNewPassword.text;
                        controller.confirmNewPassword =
                            _textFieldControllerForConfirmNewPassword.text;
                        controller.currentPassword =
                            _textFieldControllerForCurrentPassord.text;
                        controller.changePassword();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
