import 'package:elearning/app/controller/HomeController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/HomeRepository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppPref());
    Get.lazyPut<HomeController>(() => HomeController(
        repository: HomeRepository(apiClient: MyApiGetConnect())));
  }
}
