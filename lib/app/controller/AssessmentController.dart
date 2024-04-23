import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/data/model/Course.dart';
import 'package:elearning/app/data/repository/AssessmentRepository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AssessmentController extends GetxController {
  final AssessmentRepository repository;
  AssessmentController({required this.repository}) : assert(repository != null);

  var assessmensModuleList = <AssessmentModule>[].obs;

  final _emptyText = ''.obs;
  set emptyText(value) => this._emptyText.value = value;
  get emptyText => this._emptyText.value;

  final _emptyMessage = ''.obs;
  set emptyMessage(value) => this._emptyMessage.value = value;
  get emptyMessage => this._emptyMessage.value;

  final _attemptCount = 0.obs;
  set attemptCount(value) => this._attemptCount.value = value;
  get attemptCount => this._attemptCount.value;

  RxBool isAttemptEnable = true.obs;

  @override
  void onInit() {
    print('-----onInit @ controller-------');
    final employeeId = Get.find<AppPref>().employeeId;
    Course course = (Get.arguments as Course);
    _preloadAssessmentResult(employeeId.val, course.courseId!);
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady @ controller-------');
    super.onReady();
  }

  void _preloadAssessmentResult(int employeeId, int courseId) {
    EasyLoading.show(status: 'Loading...');
    repository.getAssessmentModuleList(employeeId, courseId).then(
      (value) {
        if (value!.responseCode.toString() == "1") {
          EasyLoading.dismiss();
          assessmensModuleList.value = value.moduleLists;
          if (value.moduleLists.length <= 0) {
            emptyText = "assets/icons/empty.svg";
            emptyMessage = "There is no assessment.";
          }
          print("===courselist===>${value.moduleLists.length}");
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
