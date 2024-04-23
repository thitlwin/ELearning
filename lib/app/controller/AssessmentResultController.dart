import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/TestResult.dart';
import 'package:elearning/app/data/repository/AssessmentRepository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AssessmentResultController extends GetxController {
  final AssessmentRepository repository;
  AssessmentResultController({required this.repository});

  final _testResult = TestResult().obs;
  get testResult => this._testResult.value;
  set testResult(value) => this._testResult.value = value;

  RxBool isLoadingFinished = false.obs;

  @override
  void onInit() {
    final employeeId = Get.find<AppPref>().employeeId;
    final testId = Get.find<AppPref>().testId;
    Future.delayed(Duration(milliseconds: 100), () {
      _preloadTestReslut(employeeId.val, testId.val);
    });
    super.onInit();
  }

  void _preloadTestReslut(int employeeId, int testId) {
    EasyLoading.show(status: 'Loading...');
    repository.getTestResultList(employeeId, testId).then(
      (value) {
        if (value!.responseCode.toString() == "1") {
          // EasyLoading.showSuccess("SUCCESS");
          EasyLoading.dismiss();
          value.testResult!.incorrectAnswer!
              .sort((a, b) => a.questionNo!.compareTo(b.questionNo!));
          _testResult.value = value.testResult!;
          print(
              "index length == > ${value.testResult!.incorrectAnswer!.length}");
          isLoadingFinished.value = true;
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
}
