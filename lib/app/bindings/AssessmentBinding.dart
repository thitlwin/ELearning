import 'package:elearning/app/controller/AssessmentController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/AssessmentRepository.dart';
import 'package:get/get.dart';

class AssessmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppPref());
    Get.lazyPut<AssessmentController>(() => AssessmentController(
        repository: AssessmentRepository(apiClient: MyApiGetConnect())));
  }
}
