import 'package:elearning/app/controller/TestQuestionController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/TestQuestionRepository.dart';
import 'package:get/get.dart';

class TestQuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppPref());
    Get.lazyPut<TestQuestionController>(() => TestQuestionController(
        repository: TestQuestionRepository(apiClient: MyApiGetConnect())));
  }
}
