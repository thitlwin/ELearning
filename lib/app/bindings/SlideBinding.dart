import 'package:elearning/app/controller/SlideController.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/ElearningSlideRepository.dart';
import 'package:get/get.dart';

class SlideBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlideController>(
      () => SlideController(
        repository: ElearningSlideRepository(apiClient: MyApiGetConnect()),
      ),
    );
  }
}
