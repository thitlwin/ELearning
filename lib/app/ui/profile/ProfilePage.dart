import 'package:elearning/app/controller/ProfileController.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/ProfileRepostiory.dart';
import 'package:elearning/app/ui/widgets/NotiWidget.dart';
import 'package:elearning/app/ui/widgets/RoundedButton.dart';
import 'package:elearning/app/ui/widgets/TwoLinesTitle.dart';
import 'package:elearning/app/utils/StringUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView {
  final ctrl = Get.put(ProfileController(
      repository: ProfileRepository(apiClient: MyApiGetConnect())));
  final _textFieldControllerForContact = TextEditingController(text: "");
  final _textFieldControllerForAddress = TextEditingController(text: "");
  // late ProfileInfo _profileInfo;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final ProfileController ctrl = Get.find();
    // _profileInfo = (ctrl.profileInfo as ProfileInfo);

    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: twoLinesTitle(appName, appVersion),
        actions: [notificationIcon()],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                themeData.colorScheme.primaryVariant,
                            child: Text(
                              '${ctrl.fullName.toString()[0].toUpperCase()}',
                              style: TextStyle(
                                color: themeData.colorScheme.primary,
                                fontSize: 55,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            "${ctrl.fullName}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            "${ctrl.email}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        "Employee Code: ${ctrl.employeeCode}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                margin: EdgeInsets.all(7.0),
                child: Obx(() {
                  _textFieldControllerForContact.text = ctrl.contactMobile;
                  return TextFormField(
                    controller: _textFieldControllerForContact,
                    decoration: InputDecoration(
                      hintText: "Contact Number",
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
                        Icons.phone,
                        size: 22,
                      ),
                      contentPadding: EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.sentences,
                  );
                }),
              ),
              SizedBox(
                height: 11.0,
              ),
              Container(
                margin: EdgeInsets.all(7.0),
                child: Obx(() {
                  _textFieldControllerForAddress.text = ctrl.address;
                  return TextFormField(
                    controller: _textFieldControllerForAddress,
                    decoration: InputDecoration(
                      hintText: "Address",
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
                        Icons.location_city,
                        size: 22,
                      ),
                      contentPadding: EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                  );
                }),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                alignment: Alignment.center,
                child: RoundedButton(
                  key: UniqueKey(),
                  text: "Update",
                  color: themeData.colorScheme.primary,
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    ctrl.address = _textFieldControllerForAddress.text;
                    ctrl.contactMobile = _textFieldControllerForContact.text;
                    ctrl.editProfile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
