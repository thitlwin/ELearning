import 'package:elearning/app/controller/ForgotPasswordController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/LoginRepository.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgotSuccessPage extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(
        repository: LoginRepository(MyApiGetConnect())));
    ThemeData _themeData = Theme.of(context);
    var _appPref = Get.put(AppPref());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _themeData.scaffoldBackgroundColor,
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.2,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.01),
                  SvgPicture.asset(
                    "assets/icons/successful.svg",
                    height: size.height * 0.15,
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          child: Center(
                              child: Text(
                            "We have successfully sent you the new password \n to the following email address",
                            textAlign: TextAlign.center,
                            style: _themeData.textTheme.bodyText2,
                          )),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          child: Center(
                              child: Text(
                            "${_appPref.forgotEmail.val}",
                            textAlign: TextAlign.center,
                            style: _themeData.textTheme.bodyText1,
                          )),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          child: Center(
                              child: Text(
                            "Please remember to change your password once you have log in.",
                            textAlign: TextAlign.center,
                            style: _themeData.textTheme.bodyText2,
                          )),
                        ),
                        RoundedButton(
                          key: UniqueKey(),
                          text: "Sign In".toUpperCase(),
                          color:
                              _themeData.colorScheme.secondary.withAlpha(200),
                          onPressed: () {
                            Get.offAndToNamed(Routes.LOGIN);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
