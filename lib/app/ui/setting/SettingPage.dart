import 'package:elearning/app/controller/SettingController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/ui/widgets/SuccessDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    AppPref _appPref = Get.find();
    return GetX<SettingController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text('Setting')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Notification'),
                      Switch(
                        value: controller.notiIsSwitched.value,
                        onChanged: (bool value) {
                          controller.notiIsSwitched.value = value;
                          _appPref.displayNotification.val = value;
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sound'),
                      Switch(
                        value: controller.soundIsSwitched.value,
                        onChanged: (value) {
                          controller.soundIsSwitched.value = value;
                          _appPref.playNotiSound.val = value;
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.87,
                  height: MediaQuery.of(context).size.height * 0.052,
                  margin: EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.dialog(successDialog(
                          "You have successfully save your setting"));
                    },
                    child: Text("Save"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
