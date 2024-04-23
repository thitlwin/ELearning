import 'package:elearning/app/controller/HomeController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/Course.dart';
import 'package:elearning/app/data/repository/CourseRepository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  final AppPref _appPref = Get.find<AppPref>();
  final CourseRepository repository;
  CourseController({required this.repository});
  final HomeController homeController = Get.find();
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  final _emptyText = 'There is no course.'.obs;
  set emptyText(value) => this._emptyText.value = value;
  get emptyText => this._emptyText.value;

  final _emptyMessage = ''.obs;
  set emptyMessage(value) => this._emptyMessage.value = value;
  get emptyMessage => this._emptyMessage.value;

  final _employee = 0.obs;
  get employee => this._employee.value;
  set employee(value) => this._employee.value = value;

  // var courseList = Rx<List<Course>>([]);
  final courseList = <Course>[].obs;
  // get courseList => this._courseList.value;
  // set courseList(value) => this._courseList.value = value;

  var userId;
  @override
  void onInit() {
    userId = _appPref.employeeId.val;
    _preloadCourseList(userId!);
    super.onInit();
  }

  void _preloadCourseList(int employeeId) {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    repository.getCourseList(employeeId).then((value) {
      if (value!.responseCode.toString() == "1") {
        EasyLoading.dismiss();
        // EasyLoading.showSuccess("Sucess", dismissOnTap: false);
        courseList.value = value.courses;
        if (value.courses.length <= 0) {
          emptyText = "assets/icons/empty.svg";
          emptyMessage = "There is no course.";
        }
        print("===courselist===>${value.courses.length}");
      } else {
        EasyLoading.showError(value.responseMessage.toString(),
            dismissOnTap: false);
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError("Something wrong.", dismissOnTap: false);
    });
  }

  void registerCourse(Course course) {
    EasyLoading.show(status: 'Register...', dismissOnTap: false);
    repository.registerCourse(course.courseId!, userId).then((value) {
      if (value!.responseCode.toString() == "1") {
        courseList.remove(course);
        course.coursePercentage = 0.0;
        homeController.registeredCourseList.add(course);
        //if the list is empty will show empty screen
        if (courseList.length == 0) {
          emptyText = "assets/icons/empty.svg";
        }
        // debugPrint("after remove -${courseList.length}");
        EasyLoading.showSuccess("Register Course Success");
      } else {
        EasyLoading.showError(value.responseMessage.toString());
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError("Something wrong.");
    });
  }
}
