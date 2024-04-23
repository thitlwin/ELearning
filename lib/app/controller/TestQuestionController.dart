import 'package:elearning/app/controller/AssessmentController.dart';
import 'package:elearning/app/controller/HomeController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/data/model/AssessmentQuestion.dart';
import 'package:elearning/app/data/model/request/AnswerListRequest.dart';
import 'package:elearning/app/data/model/response/SubmitAnswerResponse.dart';
import 'package:elearning/app/data/repository/TestQuestionRepository.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/TimeUpDialog.dart';
import 'package:elearning/app/ui/widgets/WarningDialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TestQuestionController extends GetxController {
  final TestQuestionRepository repository;
  TestQuestionController({required this.repository})
      : assert(repository != null);

  var _pref = Get.put(AppPref());

  final AssessmentController assessmentController = Get.find();
  final HomeController homeController = Get.find();

  final _assessmentQuestionList = Rx<List<AssessmentQuestion>>([]);
  get assessmentQuestionList => this._assessmentQuestionList.value;
  set assessmentQuestionList(value) =>
      this._assessmentQuestionList.value = value;

  final _emptyText = ''.obs;
  set emptyText(value) => this._emptyText.value = value;
  get emptyText => this._emptyText.value;

  final _thereIsNoQuesion = ''.obs;
  set thereIsNoQuesion(value) => this._thereIsNoQuesion.value = value;
  get thereIsNoQuesion => this._thereIsNoQuesion.value;

  final _questionName = ' '.obs;
  set questionName(value) => this._questionName.value = value;
  get questionName => this._questionName.value;

  final _questionNo = 0.obs;
  set questionNo(value) => this._questionNo.value = value;
  get questionNo => this._questionNo.value;

  final _assessmentQuestionLength = 0.obs;
  set assessmentQuestionLength(value) =>
      this._assessmentQuestionLength.value = value;
  get assessmentQuestionLength => this._assessmentQuestionLength.value;

  final _assessmentAnswerListLength = 0.obs;
  set assessmentAnswerListLength(value) =>
      this._assessmentAnswerListLength.value = value;
  get assessmentAnswerListLength => this._assessmentAnswerListLength.value;

  final _listenRadioStateChange = 0.obs;
  set listenRadioStateChange(value) =>
      this._listenRadioStateChange.value = value;
  get listenRadioStateChange => this._listenRadioStateChange.value;

  final _watchIndex = 0.obs;
  set watchIndex(value) => this._watchIndex.value = value;
  get watchIndex => this._watchIndex.value;

  RxBool isPreviousEnable = false.obs;
  RxBool isNextEnable = true.obs;
  RxBool isTimeUp = false.obs;
  RxBool isCloseTimeUp = false.obs;
  RxBool isQuestionEmpty = false.obs;
  RxBool isVisibleWidget = false.obs;
  RxBool isShowOtherDialog = false.obs;
  var isRadioCheck;

  @override
  void onInit() {
    // assessmentController.assessmensModuleList[_pref.courseListPointerIndex.val]
    //     .attemptCount = 0;
    print('-----onInit @ controller-------');
    int testId = _pref.testId.val;
    int employeeId = _pref.employeeId.val;
    print("--->$employeeId");
    _preloadTestQuestion(testId, employeeId);
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady @ controller-------');
    super.onReady();
  }

  makeTimeUp(int reamainingTime, bool isBeforeDue, String message1,
      String message2, bool isAutoSubmit) {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "",
        content: timeUpDialog(
            reamainingTime, isBeforeDue, message1, message2, isAutoSubmit));
    return true;
  }

  warning(String message1, bool isShowWarningicon,
      TestQuestionController controller, StopWatchTimer stopWatchTimer) {
    Get.defaultDialog(
            barrierDismissible: false,
            title: "",
            content: warningDialog(message1, controller))
        .then((value) {
      stopWatchTimer.dispose();
    });
    return true;
  }

  void _preloadTestQuestion(int testId, int employeeId) {
    EasyLoading.show(status: 'Loading...');
    repository.getTestQuestion(testId, employeeId).then(
      (value) {
        if (value!.responseCode.toString() == "1") {
          EasyLoading.dismiss();
          //initial question info
          assessmentQuestionList = value.questionLists;
          assessmentQuestionLength = value.questionLists.length;
          if (value.questionLists.length != 0) {
            questionName = value.questionLists[0].questionName;
            questionNo = value.questionLists[0].questionNo;
            assessmentAnswerListLength =
                value.questionLists[0].answerList!.length;
            isVisibleWidget.value = true;
          } else {
            //If there is no quesion, will show the empty view
            isQuestionEmpty.value = true;
            emptyText = "assets/icons/empty.svg";
            thereIsNoQuesion = "There is no question.";
            //If there is no quesion, will hide the unnecessary widgets from current widget
            isVisibleWidget.value = false;
          }
          //If the question is only "One" question will be disable the "Next Button".Will enable "Submit Button"
          assessmentQuestionLength == 1
              ? isNextEnable.value = false
              : isNextEnable.value = true;
        } else {
          EasyLoading.showError(value.responseMessage.toString());
        }
      },
    ).onError(
      (error, stackTrace) {
        EasyLoading.showError("Something wrong.");
      },
    );
  }

  void makeAssessmentAnswerSubmit(
      List<AssessmentQuestion> assessmentQuestionAndAnswer,
      bool isAutoSubmit) async {
    AssessmentModule? assessmentModule = _pref.assessmentModule.val;
    EasyLoading.show(status: "Please wait...", dismissOnTap: false);
    if (assessmentQuestionAndAnswer != null) {
      AnswerListRequest request =
          AnswerListRequest(dataList: assessmentQuestionAndAnswer);
      try {
        SubmitAnswerResponse response = await repository
            .makeAssessmentAnswerSubmit(request, _pref.employeeId.val);
        if (response.responseCode == '1') {
          EasyLoading.dismiss();
          _attemptAndUpdateCourseList(
              assessmentModule!,
              response.answerResult!.isPassed,
              response.answerResult!.attemptsRemaining,
              response.answerResult!.status,
              response.answerResult!.assessmentPercentage,
              response.answerResult!.coursePercentage);
          if (isAutoSubmit == true) {
            if (isShowOtherDialog.value == true) {
              Get.back();
              makeTimeUp(0, false, "Time is up",
                  "Your answer has been submitted.", isAutoSubmit);
            } else {
              makeTimeUp(0, false, "Time is up",
                  "Your answer has been submitted.", isAutoSubmit);
            }
          } else {
            Get.offAndToNamed(Routes.ASSESSMENT_RESULT_PAGE);
          }
        } else {
          EasyLoading.showError(
              'Response Code: ${response.responseCode} \nResponse Message: ${response.responseMessage}');
        }
      } catch (e) {
        EasyLoading.showError(e.toString());
      }
    }
  }

  //updating module list of attemptCount and isPassed
  void _attemptAndUpdateCourseList(
      AssessmentModule assessmentModule,
      bool? isPassed,
      int? attemptsRemaining,
      String? status,
      double? assessmentPercentage,
      double? coursePercentage) {
    //for assessment list
    //getting the index of assessmentModule
    int assIndex =
        assessmentController.assessmensModuleList.indexOf(assessmentModule);
    //updating "attemptCount" and "isPassed" and "status" in module list
    int currentAttempt =
        assessmentController.assessmensModuleList[assIndex].maxAttempts! -
            attemptsRemaining!;
    assessmentController.assessmensModuleList[assIndex].attemptCount =
        currentAttempt;
    assessmentController.assessmensModuleList[assIndex].status = status;
    assessmentController.assessmensModuleList[assIndex].isPassed = isPassed;
    assessmentController.attemptCount = currentAttempt;
    //reupdate module object in Local Storage
    assessmentModule.attemptCount = currentAttempt;
    assessmentModule.status = status;
    assessmentModule.isPassed = isPassed;
    _pref.assessmentModule.val = assessmentModule;

    //for course list
    //update in registeratedCourseList
    homeController
        .registeredCourseList[homeController.selectedRegisteredCourseIndex]
        .coursePercentage = coursePercentage;
    homeController
        .registeredCourseList[homeController.selectedRegisteredCourseIndex]
        .assessmentPercentage = assessmentPercentage;
    //update in courseDetails page
    homeController.completionAssesment = assessmentPercentage;
    //notify controller is update
    homeController.isUpdateCourseInLocal.value = true;
  }

  //notify and listen the changes of observale value when user click "Next" and "Previous"
  notifyObsValueChange(int index) {
    watchIndex = index;
    isRadioCheck = assessmentQuestionList[watchIndex].selectedAnswerPosition;
    assessmentAnswerListLength =
        assessmentQuestionList[watchIndex].answerList!.length;
    questionName = assessmentQuestionList[watchIndex].questionName;
    questionNo = assessmentQuestionList[watchIndex].questionNo;
    (watchIndex == (assessmentQuestionLength - 1))
        ? isNextEnable.value = false
        : isNextEnable.value = true;
    (watchIndex > 0)
        ? isPreviousEnable.value = true
        : isPreviousEnable.value = false;
  }

  //update your answer in question list, when user choice "Radio Button"
  yourResult(Object? value, int index, int watchIndex) {
    listenRadioStateChange = listenRadioStateChange + 1;
    isRadioCheck = value;
    assessmentQuestionList[watchIndex].selectedAnswerPosition = index;
    assessmentQuestionList[watchIndex].isAlreadyAnswer = true;
    assessmentQuestionList[watchIndex].yourAnswerId =
        assessmentQuestionList[watchIndex].answerList![index].answerId;
  }
}
