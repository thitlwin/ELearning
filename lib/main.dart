import 'package:elearning/app/bindings/HomeBinding.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/utils/AppTheme.dart';
import 'package:elearning/app/utils/StringUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';
import 'app/routes/AppPages.dart';

Future<void> main() async {
  await GetStorage.init(AppPref.prefBoxName);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.WELCOME,
      theme: AppTheme.lightTheme,
      defaultTransition: Transition.fade,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
      // home: HomePage(),
      builder: EasyLoading.init(),
      onReady: () {
        AppPref _appPref = Get.find();
        if (_appPref.token.val.toString().length > 0) {
          Get.offAndToNamed(Routes.BOTTOM_NAVIGATION);
        }
      },
    ),
  );
  configLoading();

  // load version number
  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    appVersion += packageInfo.version;
  });
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppTheme.lightTheme.primaryColor
    ..backgroundColor = AppTheme.lightTheme.dialogBackgroundColor
    ..indicatorColor = AppTheme.lightTheme.primaryColor
    ..textColor = AppTheme.lightTheme.primaryColor
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.blue.withOpacity(0.2)
    ..userInteractions = false
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}
