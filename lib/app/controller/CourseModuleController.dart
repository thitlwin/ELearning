import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/Course.dart';
import 'package:elearning/app/data/model/Module.dart';
import 'package:elearning/app/data/repository/CourseModuleRepository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CourseModuleController extends GetxController {
  final AppPref _appPref = Get.find<AppPref>();
  final CourseModuleRepository repository;
  CourseModuleController({required this.repository});
  var isContentEmpty = false.obs;

  var moduleList = <Module>[].obs;
  // var moduleList = Rx<List<Module>>([]);

  @override
  void onInit() {
    final employeeId = _appPref.employeeId;
    Course course = Get.arguments;
    _preloadCourseModuleList(course.courseId!, employeeId.val);
    super.onInit();
  }

  void _preloadCourseModuleList(int courseId, int employeeId) {
    EasyLoading.show(status: 'Loading...');
    repository.getCourseModuleList(courseId, employeeId).then(
      (value) {
        if (value!.responseCode.toString() == "1") {
          EasyLoading.dismiss();
          moduleList.value = value.modules;
          if (value.modules.length == 0) isContentEmpty.value = true;
        } else {
          EasyLoading.showError(value.responseMessage.toString());
        }
      },
    ).onError((error, stackTrace) {
      EasyLoading.showError("Something wrong.");
    });
  }
}
