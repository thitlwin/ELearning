import 'package:elearning/app/controller/ForgotPasswordController.dart';
import 'package:elearning/app/controller/OTPVerificationController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget otpVerificationDialogForPassword(String email) {
  ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();
  OTPVerificationController otpController =
      Get.find<OTPVerificationController>();
  otpController.email = email;
  return Builder(
    builder: (context) {
      ThemeData themeData = Theme.of(context);
      late final TextEditingController _otp1Controller,
          _otp2Controller,
          _otp3Controller,
          _otp4Controller,
          _otp5Controller,
          _otp6Controller;
      late final FocusNode _otp1FocusNode,
          _otp2FocusNode,
          _otp3FocusNode,
          _otp4FocusNode,
          _otp5FocusNode,
          _otp6FocusNode;
      _otp1Controller = TextEditingController();
      _otp2Controller = TextEditingController();
      _otp3Controller = TextEditingController();
      _otp4Controller = TextEditingController();
      _otp5Controller = TextEditingController();
      _otp6Controller = TextEditingController();

      _otp1FocusNode = FocusNode();
      _otp2FocusNode = FocusNode();
      _otp3FocusNode = FocusNode();
      _otp4FocusNode = FocusNode();
      _otp5FocusNode = FocusNode();
      _otp6FocusNode = FocusNode();

      _otp1Controller.addListener(() {
        if (_otp1Controller.text.length >= 1) {
          _otp2FocusNode.requestFocus();
        }
      });

      _otp2Controller.addListener(() {
        if (_otp2Controller.text.length >= 1) {
          _otp3FocusNode.requestFocus();
        }
      });

      _otp3Controller.addListener(() {
        if (_otp3Controller.text.length >= 1) {
          _otp4FocusNode.requestFocus();
        }
      });

      _otp4Controller.addListener(() {
        if (_otp4Controller.text.length >= 1) {
          _otp5FocusNode.requestFocus();
        }
      });

      _otp5Controller.addListener(() {
        if (_otp5Controller.text.length >= 1) {
          _otp6FocusNode.requestFocus();
        }
      });

      return Flexible(
        flex: 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Text(
                "We have sent a verification code to your registered email.",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(flex: 2),
            Flexible(
              flex: 3,
              child: Text(
                "${otpController.email}",
                style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w200,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(flex: 2),
            Flexible(
              flex: 5,
              child: Text(
                "Please enter the code to receive your new password.",
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(flex: 2),
            Flexible(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  otpController.makeOtpRequest(otpController.email);
                },
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: themeData.primaryColorDark,
                      decoration: TextDecoration.underline),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(flex: 2),
            Flexible(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  singleDigitWidget(_otp1Controller, _otp1FocusNode),
                  singleDigitWidget(_otp2Controller, _otp2FocusNode),
                  singleDigitWidget(_otp3Controller, _otp3FocusNode),
                  singleDigitWidget(_otp4Controller, _otp4FocusNode),
                  singleDigitWidget(_otp5Controller, _otp5FocusNode),
                  singleDigitWidget(_otp6Controller, _otp6FocusNode),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Obx(
                () => otpController.isOtpRequired.value
                    ? Text("6 digits OTP code is required.",
                        style: TextStyle(color: Colors.red, fontSize: 10))
                    : Container(),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: themeData.colorScheme.secondaryVariant),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child:
                      SizedBox(width: 70, child: Center(child: Text("Cancel"))),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: themeData.colorScheme.secondaryVariant),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_otp2Controller.text.isEmpty ||
                        _otp2Controller.text.isEmpty ||
                        _otp3Controller.text.isEmpty ||
                        _otp4Controller.text.isEmpty ||
                        _otp5Controller.text.isEmpty ||
                        _otp6Controller.text.isEmpty) {
                      otpController.isOtpRequired.value = true;
                      return;
                    }
                    String otpCode =
                        "${_otp1Controller.text}${_otp2Controller.text}${_otp3Controller.text}${_otp4Controller.text}${_otp5Controller.text}${_otp6Controller.text}";
                    forgotPasswordController
                        .submitOTPCodeFromPasswordForgot(otpCode);
                  },
                  child:
                      SizedBox(width: 70, child: Center(child: Text("Submit"))),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

Widget singleDigitWidget(
    TextEditingController _controller, FocusNode _focusNode) {
  return Container(
    width: 35,
    height: 38,
    margin: EdgeInsets.symmetric(horizontal: 2.0),
    // color: Colors.transparent,
    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    child: TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18),
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
      ],
      keyboardType: TextInputType.number,
      onTap: () {
        if (_controller.text.length >= 1) {
          _controller.selection = TextSelection(
              baseOffset: 0, extentOffset: _controller.text.length);
          _focusNode.requestFocus();
        }
      },
    ),
  );
}
