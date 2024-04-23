import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/TwoLinesTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class AssessmentConfirmationPage extends GetView {
  var _pref = Get.put(AppPref());
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    AssessmentModule? module = _pref.assessmentModule.val;
    List<String> allowedTime = module!.allowedTime!.split(':');
    int _minute = int.parse(allowedTime[1]);
    int _hour = int.parse(allowedTime[0]);
    var moduleName = "${module.moduleName}";
    StopWatchTimer _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromHour(_hour) +
          StopWatchTimer.getMilliSecFromMinute(
              _minute), // millisecond => minute.
      onChange: (value) {},
    );
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: twoLinesTitle("$moduleName", 'E-Assessment'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snap) {
                  final value = snap.data;
                  final displayTime =
                      StopWatchTimer.getDisplayTimeMinute(value!);
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "You are about to attempt the assessment for",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "$moduleName.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "You are given $displayTime minutes to attempt the assessment. You will fail automatically if you do not complete the assessment before the time runs or if you log out.",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                  );
                },
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
                  if (module.isPassed == true) {
                    EasyLoading.showError("You have passed the assessment.");
                  } else {
                    !(module.attemptCount! >= (module.maxAttempts as int))
                        ? Get.offAndToNamed(Routes.ASSESSMENT_QUESTION_PAGE)
                        : EasyLoading.showError(
                            "You have reached the maximun attempt count.");
                  }
                },
                child: SizedBox(
                    width: 100,
                    child: Center(
                        child: Text("Start\nAssessment",
                            textAlign: TextAlign.center))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
