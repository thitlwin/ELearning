import 'package:elearning/app/controller/CourseController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/CourseRepository.dart';
import 'package:get/get.dart';

class CourseListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppPref());
    Get.lazyPut<CourseController>(() => CourseController(
        repository: CourseRepository(apiClient: MyApiGetConnect())));
    // CourseListRepository(MyApiGetConnect())));
  }
}
