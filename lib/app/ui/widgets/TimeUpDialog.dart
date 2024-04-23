import 'package:elearning/app/controller/TestQuestionController.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

Widget timeUpDialog(int totalRemainingTimeAsMilli, bool isBeforeDue,
    String message1, String message2, bool isAutoSubmit) {
  TestQuestionController controller = Get.find();
  StopWatchTimer stopWatchTimer = _stopWatchTimber(totalRemainingTimeAsMilli);
  stopWatchTimer.onExecute.add(StopWatchExecute.start);
  controller.isShowOtherDialog.value = true;
  return Builder(
    builder: (context) {
      // Future.delayed(Duration(seconds: 15), () {
      //   if (isBeforeDue) {
      //     Get.back();
      //   }
      // });
      ThemeData themeData = Theme.of(context);
      return WillPopScope(
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Visibility(
                  visible: !isAutoSubmit,
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
                Visibility(
                  visible: isBeforeDue,
                  child: StreamBuilder<int>(
                    stream: stopWatchTimer.rawTime,
                    initialData: stopWatchTimer.rawTime.value,
                    builder: (context, snap) {
                      final value = snap.data;
                      final displayTime = StopWatchTimer.getDisplayTime(value!);
                      List<String> displayType = displayTime.split('.');
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              "${displayType[0]}",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "$message2",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
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
                    if (isAutoSubmit == true) {
                      Get.back();
                      Get.offAndToNamed(Routes.ASSESSMENT_RESULT_PAGE);
                    } else {
                      controller.isShowOtherDialog.value = false;
                      stopWatchTimer.dispose();
                      Get.back();
                    }
                  },
                  child: SizedBox(
                      width: 70, child: Center(child: Text("   OK   "))),
                ),
              ],
            ),
          ),
          onWillPop: onWillPop);
    },
  );
}

StopWatchTimer _stopWatchTimber(totalRemainingTimeAsMilli) {
  return StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: totalRemainingTimeAsMilli,
    onChange: (value) {},
  );
}

Future<bool> onWillPop() async {
  return false;
}
