import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text('Sign In')),
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
            Positioned(
              right: 30,
              left: 30,
              top: 90,
              child: Image.asset(
                "assets/images/soteria_logo.png",
                width: size.width,
              ),
            ),
            Positioned(
                right: 30,
                left: 30,
                top: 170,
                child: Center(
                  child: Text(
                    "vLearn",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 45,
                        fontFamily: 'Newsreader',
                        color: Colors.orangeAccent.withOpacity(0.8)),
                  ),
                )),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.70),
                  // SvgPicture.asset(
                  //   "assets/icons/chat.svg",
                  //   height: size.height * 0.45,
                  // ),
                  // SizedBox(height: size.height * 0.05),
                  RoundedButton(
                    key: UniqueKey(),
                    text: "LOGIN",
                    // textColor: Colors.black,
                    color: _themeData.primaryColor,
                    onPressed: () {
                      debugPrint('LOGIN-----');
                      Get.offAndToNamed(Routes.LOGIN);
                    },
                  ),
                  RoundedButton(
                    key: UniqueKey(),
                    text: "SIGN UP",
                    color: _themeData.colorScheme.primaryVariant,
                    onPressed: () {
                      debugPrint('REGISTRATION-----');
                      Get.offAndToNamed(Routes.REGISTRATION);
                    },
                    textColor: Colors.black,
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
