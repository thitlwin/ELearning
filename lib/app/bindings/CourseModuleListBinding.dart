import 'package:elearning/app/controller/CourseModuleController.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/CourseModuleRepository.dart';
import 'package:get/get.dart';

class CourseModuleListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseModuleController>(
      () => CourseModuleController(
          repository: CourseModuleRepository(apiClient: MyApiGetConnect())),
    );
  }
}
