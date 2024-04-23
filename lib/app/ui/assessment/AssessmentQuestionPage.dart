import 'package:elearning/app/controller/TestQuestionController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/data/model/AssessmentQuestion.dart';
import 'package:elearning/app/ui/widgets/TwoLinesTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:get/get.dart';

class AssessmentQuestionPage extends GetView<TestQuestionController> {
  late ThemeData themeData;
  var _pref = Get.put(AppPref());
  late bool isReadyAlertBox = false;
  late int listenIsRadioClick;
  late List<AssessmentQuestion> assessmentQuestion;
  //alarm before 5 minutes
  final int alarmRemainingTime = 300000;
  late StopWatchTimer stopWatchTimer;
  late int hour;
  late int minute;
  bool isTimeUp = false;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    AssessmentModule? module = _pref.assessmentModule.val;
    List<String> allowedTime = module!.allowedTime!.split(':');

    var moduleName = "${module.moduleName}";
    hour = int.parse(allowedTime[0]);
    minute = int.parse(allowedTime[1]);
    stopWatchTimer = _stopWatchTimber(hour, minute);
    stopWatchTimer.onExecute.add(StopWatchExecute.start);
    return GetX<TestQuestionController>(
      initState: (state) {},
      builder: (controller) {
        return WillPopScope(
          child: Scaffold(
            appBar: AppBar(
              // automaticallyImplyLeading: false,
              title: twoLinesTitle("$moduleName", 'E-Assessment'),
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Visibility(
                    visible: controller.isVisibleWidget.value,
                    child: Container(
                      child: StreamBuilder<int>(
                        stream: stopWatchTimer.rawTime,
                        initialData: stopWatchTimer.rawTime.value,
                        builder: (context, snap) {
                          final value = snap.data;
                          final displayTime =
                              StopWatchTimer.getDisplayTime(value!);
                          List<String> displayType = displayTime.split('.');
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "${displayType[0]}",
                                  style: TextStyle(
                                    color: controller.isCloseTimeUp.value
                                        ? Colors.redAccent
                                        : Colors.black45,
                                    fontSize: 25,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isVisibleWidget.value,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(0.0),
                      child: InkWell(
                        onTap: () {
                          // _showQuestionList();
                        },
                        splashColor: themeData.splashColor,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Question ${controller.questionNo}: ${controller.questionName}",
                            style: themeData.textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                    ),
                  ),
                  Visibility(
                    visible: controller.isVisibleWidget.value,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Question ",
                          ),
                          Container(
                            child: Obx(
                              () {
                                assessmentQuestion =
                                    controller.assessmentQuestionList;
                                return Container(
                                  width: 60,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(width: 9),
                                      Text("${controller.questionNo}"),
                                      SizedBox(width: 2),
                                      PopupMenuButton(
                                        // initialValue: 0,
                                        child: Center(
                                            child: Icon(Icons.arrow_drop_down)),
                                        itemBuilder: (context) {
                                          return List.generate(
                                              controller
                                                  .assessmentQuestionLength,
                                              (index) {
                                            return PopupMenuItem(
                                              value: index,
                                              child: Text('${index + 1}'),
                                            );
                                          });
                                        },
                                        onSelected: (index) {
                                          controller.watchIndex = index;
                                          controller.notifyObsValueChange(
                                              controller.watchIndex);
                                        },
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                );
                              },
                            ),
                          ),
                          Text(
                            "  of  ${controller.assessmentQuestionLength}",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    listenIsRadioClick = controller.listenRadioStateChange;
                    return Expanded(
                      child: !controller.isQuestionEmpty.value
                          ? CustomScrollView(
                              slivers: [
                                SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        _builder,
                                        childCount: controller
                                            .assessmentAnswerListLength)),
                              ],
                            )
                          : Container(
                              child: Center(
                                child: Obx(
                                  () {
                                    //if there is no question will dispose timer
                                    stopWatchTimer.dispose();
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "${controller.emptyText}",
                                          color: Colors.black38,
                                          width: 50,
                                        ),
                                        Text(
                                          "\n${controller.thereIsNoQuesion}",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                    );
                  }),
                  Visibility(
                    visible: controller.isVisibleWidget.value,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Visibility(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: themeData.colorScheme
                                                  .secondaryVariant),
                                        ),
                                      ),
                                    ),
                                    onPressed: (controller
                                            .isPreviousEnable.value)
                                        ? () {
                                            controller.watchIndex =
                                                controller.watchIndex - 1;
                                            if (!(controller.watchIndex < 0)) {
                                              controller.notifyObsValueChange(
                                                  controller.watchIndex);
                                            }
                                          }
                                        : null,
                                    child: SizedBox(
                                        width: 70,
                                        child: Center(child: Text("Previous"))),
                                  ),
                                ),
                                Visibility(
                                  child: controller.isNextEnable.value
                                      ? _showNextButton()
                                      : _showSubmitButton(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onWillPop: _onBackPressed,
        );
      },
    );
  }

  Widget? _builder(BuildContext context, int index) {
    return Container(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
              "${controller.assessmentQuestionList[controller.watchIndex].answerList![index].answerNo} ${controller.assessmentQuestionList[controller.watchIndex].answerList![index].answerText}",
              style: themeData.textTheme.subtitle2),
        ),
        contentPadding: EdgeInsets.all(0),
        dense: true,
        trailing: Radio(
          value: index,
          activeColor: themeData.colorScheme.primary,
          groupValue: controller.isRadioCheck,
          onChanged: (value) {
            if (!(controller.isTimeUp.value)) {
              controller.yourResult(value, index, controller.watchIndex);
            } else {
              //after time up you are not allow to edit the answer
              // controller.makeTimeUp(
              //   0,
              //   false,
              //   "Time is up",
              //   "Please submit your answer.",
              // );
            }
          },
        ),
      ),
    );
  }

  // void _showQuestionList() {
  //   Get.dialog(QuestionListView(
  //       assessmentQuestionList: controller.assessmentQuestionList,
  //       assessmentQuestionLength: controller.assessmentQuestionLength));
  // }

  void _displayConfirmationDialog() {
    Get.dialog(AlertDialog(
      actions: [
        Center(
          child: OutlinedButton(
              onPressed: () {
                Get.back();
                stopWatchTimer.dispose();
                controller.makeAssessmentAnswerSubmit(
                    controller.assessmentQuestionList, false);
              },
              child: Text("Yes, I am sure")),
        ),
        Center(
          child: OutlinedButton(
              onPressed: () {
                debugPrint('press check again');
                Get.back();
              },
              child: Text("I want to check my answer again")),
        )
      ],
      content: Text(
        "Are you sure you want to submit the assessment?\n\nPlease ensure that you check your answer before submission.",
        textAlign: TextAlign.center,
      ),
    ));
  }

  _showNextButton() {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: themeData.colorScheme.secondaryVariant),
          ),
        ),
      ),
      onPressed: () {
        controller.watchIndex = controller.watchIndex + 1;
        if (!(controller.watchIndex >= controller.assessmentQuestionLength)) {
          controller.notifyObsValueChange(controller.watchIndex);
        } else {
          print("invalid index range ${controller.watchIndex}");
        }
      },
      child: SizedBox(width: 70, child: Center(child: Text("Next"))),
    );
  }

  _showSubmitButton() {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: themeData.colorScheme.secondaryVariant),
          ),
        ),
      ),
      onPressed: () {
        _displayConfirmationDialog();
      },
      child: SizedBox(width: 70, child: Center(child: Text("Submit"))),
    );
  }

  StopWatchTimer _stopWatchTimber(int hour, int minute) {
    return StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromHour(hour) +
          StopWatchTimer.getMilliSecFromMinute(minute),
      onChange: (value) {
        if (value < alarmRemainingTime) {
          if (!(controller.isCloseTimeUp.value)) {
            controller.isCloseTimeUp.value = true;
          }
          if (isReadyAlertBox == false) {
            isReadyAlertBox = controller.makeTimeUp(
              value,
              true,
              "Time will be due in",
              "please review and submit your answer.",
              false,
            );
          }
        }
        if (value == 0) {
          controller.isTimeUp.value = true;
          isTimeUp = true;
          controller.makeAssessmentAnswerSubmit(
              controller.assessmentQuestionList, true);
        }
      },
    );
  }

  Future<bool> _onBackPressed() async {
    // stopWatchTimer.dispose();
    if (isTimeUp == false) {
      if (controller.isVisibleWidget.value == false) {
        return true;
      } else {
        controller.warning(
            "Once you exit,\nyour current answer will be submitted.\nAre you sure you want to exit?",
            true,
            controller,
            stopWatchTimer);
      }
    }
    return false;
  }
}
