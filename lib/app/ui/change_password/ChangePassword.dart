import 'package:elearning/app/controller/LoginController.dart';
import 'package:elearning/app/ui/widgets/SuccessDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends GetView<LoginController> {
  var _textFieldControllerForCurrentPassord = TextEditingController(text: "");
  var _textFieldControllerForNewPassword = TextEditingController(text: "");
  var _textFieldControllerForConfirmNewPassword =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    // ForgotPasswordController controller = Get.put(ForgotPasswordController());
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      appBar: AppBar(title: Text('Setting')),
      body: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text("Current Password",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 16)),
              //     ],
              //   ),
              // ),
              Obx(
                () => Container(
                  margin: EdgeInsets.only(top: 16),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: controller.passwordVisible.value,
                    controller: _textFieldControllerForCurrentPassord,
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
                      fillColor: themeData.colorScheme.background,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 22,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.passwordVisible.value =
                              !controller.passwordVisible.value;
                        },
                        child: Icon(
                          controller.passwordVisible.value
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text("New Password",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 16)),
              //     ],
              //   ),
              // ),
              Obx(
                () => Container(
                  margin: EdgeInsets.only(top: 16),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: controller.passwordVisible.value,
                    controller: _textFieldControllerForNewPassword,
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
                      fillColor: themeData.colorScheme.background,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 22,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.passwordVisible.value =
                              !controller.passwordVisible.value;
                        },
                        child: Icon(
                          controller.passwordVisible.value
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text("Confirm New Password",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 16)),
              //     ],
              //   ),
              // ),
              Obx(
                () => Container(
                  margin: EdgeInsets.only(top: 16),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: controller.passwordVisible.value,
                    controller: _textFieldControllerForConfirmNewPassword,
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
                      fillColor: themeData.colorScheme.background,
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 22,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.passwordVisible.value =
                              !controller.passwordVisible.value;
                        },
                        child: Icon(
                          controller.passwordVisible.value
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
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    controller.newPassword =
                        _textFieldControllerForNewPassword.text;
                    controller.confirmNewPassword =
                        _textFieldControllerForConfirmNewPassword.text;
                    controller.currentPassword =
                        _textFieldControllerForCurrentPassord.text;
                    controller.changePassword();
                    // Get.dialog(successDialog(
                    //     "You have successfully change your password"));
                  },
                  child: Text("Save"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
