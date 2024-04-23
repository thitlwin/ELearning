import 'package:elearning/app/controller/AssessmentResultController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/data/model/TestResult.dart';
import 'package:elearning/app/ui/widgets/TwoLinesTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AssessmentResultPage extends GetView<AssessmentResultController> {
  late TestResult _testResult;
  late ThemeData themeData;
  var _pref = Get.put(AppPref());
  var moduleName;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    AssessmentModule? module = _pref.assessmentModule.val;
    moduleName = "${module!.moduleName}";
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: twoLinesTitle("$moduleName", 'Result'),
      ),
      body: SafeArea(
        child: Obx(
          () {
            _testResult = controller.testResult;
            return controller.isLoadingFinished.value
                ? _returnList()
                : _emptyView();
          },
        ),
      ),
    );
  }

  Widget? _builder(BuildContext context, int index) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
            "Question ${_testResult.incorrectAnswer![index].questionNo}",
            style: themeData.textTheme.subtitle2),
      ),
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_testResult.incorrectAnswer![index].questionName}",
                style: themeData.textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                _filterOriginalAnswer(
                    _testResult.incorrectAnswer![index].answerList!.length,
                    index),
                style: themeData.textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                _incorrectAnswer(
                    _testResult.incorrectAnswer![index].yourAnswerId,
                    _testResult.incorrectAnswer![index].answerList!.length,
                    index),
                style: themeData.textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Explanation : ${_testResult.incorrectAnswer![index].answerExplanation}",
                style: themeData.textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _filterOriginalAnswer(int length, int index) {
    String _correctAnswer = "";
    for (int i = 0; i < length; i++) {
      if (_testResult.incorrectAnswer![index].answerList![i].isCorrectAnswer ==
          true) {
        _correctAnswer =
            "Answer : ${_testResult.incorrectAnswer![index].answerList![i].answerNo} ${_testResult.incorrectAnswer![index].answerList![i].answerText}";
      }
    }
    return _correctAnswer;
  }

  String _incorrectAnswer(int? yourAnswerId, int length, int index) {
    String _incorrectAnswer = "You're not answered for the question.";
    for (int i = 0; i < length; i++) {
      if (_testResult.incorrectAnswer![index].answerList![i].answerId ==
          yourAnswerId) {
        _incorrectAnswer =
            "Choosen Answer : ${_testResult.incorrectAnswer![index].answerList![i].answerNo} ${_testResult.incorrectAnswer![index].answerList![i].answerText}";
      }
    }
    return _incorrectAnswer;
  }

  _emptyView() {
    return Container();
  }

  _returnList() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      _testResult.isPass == true
                          ? "assets/icons/success.svg"
                          : "assets/icons/failure.svg",
                      width: 70,
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Text(
                          _testResult.isPass == true
                              ? "Congratulations you have passed the assessment for"
                              : "Unfortunately you have failed the E-Assessment for",
                          style: themeData.textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "$moduleName",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                        "${_testResult.correctAnswerCount}/${_testResult.totalQuestionCount}",
                        style: themeData.textTheme.bodyText1,
                        textAlign: TextAlign.center),
                    SizedBox(height: 30),
                    Text(
                      "${_testResult.incorrectAnswerCount} questions you have failed to answer correctly",
                      style: themeData.textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(2))),
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(_builder,
                childCount: _testResult.incorrectAnswer!.length)),
      ],
    );
  }
}
