import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/Course.dart';
import 'package:elearning/app/data/repository/HomeRepository.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/utils/Common.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController({required this.repository});
  final AppPref _appPref = Get.find<AppPref>();

  final _emptyText = ''.obs;
  set emptyText(value) => this._emptyText.value = value;
  get emptyText => this._emptyText.value;

  final _emptyMessage = ''.obs;
  set emptyMessage(value) => this._emptyMessage.value = value;
  get emptyMessage => this._emptyMessage.value;

  final _courseName = ''.obs;
  set courseName(value) => this._courseName.value = value;
  get courseName => this._courseName.value;

  final _completionAssesment = 0.0.obs;
  set completionAssesment(value) => this._completionAssesment.value = value;
  get completionAssesment => this._completionAssesment.value;

  final _completionElearn = 0.0.obs;
  set completionElearn(value) => this._completionElearn.value = value;
  get completionElearn => this._completionElearn.value;

  RxBool isUpdateCourseInLocal = false.obs;
  var registeredCourseList = <Course>[].obs;
  var selectedRegisteredCourseIndex;
  @override
  void onInit() {
    final employeeId = _appPref.employeeId.val;
    _loadRegisteredCourses(employeeId);
    super.onInit();
  }

  void _loadRegisteredCourses(int employeeId) {
    EasyLoading.show(status: 'Loading...');
    repository.getRegisteredCourses(employeeId).then((value) {
      if (value!.responseCode.toString() == "1") {
        EasyLoading.dismiss();
        emptyText = "assets/icons/empty.svg";
        emptyMessage = "There is no registered course.";
        registeredCourseList.value = value.registeredCourse;
      } else {
        EasyLoading.showError(value.responseMessage.toString());
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError("Something wrong.");
    });
  }

  void doLogout() {
    repository.doLogout().then((value) {
      if (value!.responseCode.toString() == "1") {
        clearUserInforFromPref(_appPref);
        Get.offAndToNamed(Routes.LOGIN);
        EasyLoading.showSuccess("You have successfully logout");
      } else
        EasyLoading.showError("Fail to logout.");
    });
  }
}
