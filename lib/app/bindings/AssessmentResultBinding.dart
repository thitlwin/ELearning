import 'package:elearning/app/controller/AssessmentResultController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/AssessmentRepository.dart';
import 'package:get/get.dart';

class AssessmentResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppPref());
    Get.lazyPut<AssessmentResultController>(() => AssessmentResultController(
        repository: AssessmentRepository(apiClient: MyApiGetConnect())));
  }
}
