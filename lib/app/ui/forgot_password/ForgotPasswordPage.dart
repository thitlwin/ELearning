import 'package:elearning/app/controller/ForgotPasswordController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  final _formKey = GlobalKey<FormState>();
  final _textEditingControllerForEmail = TextEditingController();
  var _appPref = Get.put(AppPref());

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _themeData.scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
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
                      "assets/icons/forgot-pwd.svg",
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
                              "Please key in your authorized email, \nwe will be sending a verification code.\n\nPlease remember to change your \npassword once you have login.",
                              textAlign: TextAlign.center,
                              style: _themeData.textTheme.bodyText2,
                            )),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Form(
                            key: _formKey,
                            child: Container(
                              margin: EdgeInsets.only(top: 24),
                              child: TextFormField(
                                controller: _textEditingControllerForEmail,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email address is required.";
                                  }
                                  if (!value.isEmail)
                                    return "Invalid email address.";
                                },
                                decoration: InputDecoration(
                                  hintText: "Email address",
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
                                  fillColor:
                                      _themeData.colorScheme.primaryVariant,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    size: 22,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                // textCapitalization: TextCapitalization.sentences,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RoundedButton(
                                  key: UniqueKey(),
                                  text: "Back".toUpperCase(),
                                  color: _themeData.colorScheme.secondary
                                      .withAlpha(200),
                                  onPressed: () {
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    Get.offAndToNamed(Routes.LOGIN);
                                  },
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: RoundedButton(
                                  key: UniqueKey(),
                                  text: "Send".toUpperCase(),
                                  color: _themeData.colorScheme.primary,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      controller.emailAddress =
                                          _textEditingControllerForEmail.text
                                              .toString();
                                      _appPref.forgotEmail.val =
                                          _textEditingControllerForEmail.text;
                                      controller.requestOtpCode(
                                          controller.emailAddress);
                                    }
                                  },
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
