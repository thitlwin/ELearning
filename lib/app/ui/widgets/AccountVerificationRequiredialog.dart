import 'package:elearning/app/ui/otp_verification/OTPVerificatioDialogForRegistration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountVerificationRequiredialog extends GetWidget {
  final String message, email;
  AccountVerificationRequiredialog(this.message, this.email);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(message),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: themeData.colorScheme.secondaryVariant),
              ),
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: SizedBox(width: 70, child: Center(child: Text("Close"))),
        ),
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: themeData.colorScheme.secondaryVariant),
              ),
            ),
          ),
          onPressed: () {
            Get.back();
            // Get.toNamed(Routes.OTP_VERIFICATION_PAGE, arguments: email);
            Get.defaultDialog(
                title: "",
                content: otpVerificationDialogForRegistration(email));
          },
          child: SizedBox(width: 70, child: Center(child: Text("Verify"))),
        ),
      ],
    );
  }
}
