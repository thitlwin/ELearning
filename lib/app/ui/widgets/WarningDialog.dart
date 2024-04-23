import 'package:elearning/app/controller/TestQuestionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget warningDialog(String message1, TestQuestionController controller) {
  controller.isShowOtherDialog.value = true;
  return Builder(
    builder: (context) {
      ThemeData themeData = Theme.of(context);
      return WillPopScope(
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Visibility(
                  child: Icon(
                    Icons.warning,
                    size: 35,
                    color: Colors.redAccent,
                  ),
                ),
                Text(
                  "\n$message1",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 26),
                Visibility(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color:
                                      themeData.colorScheme.secondaryVariant),
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller.isShowOtherDialog.value = false;
                          Get.back();
                        },
                        child: SizedBox(
                            width: 70, child: Center(child: Text("No"))),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color:
                                      themeData.colorScheme.secondaryVariant),
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller.isShowOtherDialog.value = false;
                          Get.back();
                          controller.makeAssessmentAnswerSubmit(
                              controller.assessmentQuestionList, false);
                        },
                        child: SizedBox(
                            width: 70, child: Center(child: Text("Yes"))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onWillPop: onWillPop);
    },
  );
}

Future<bool> onWillPop() async {
  return false;
}
