import 'package:elearning/app/controller/ProfileController.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/ProfileRepostiory.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppPref());
    Get.lazyPut<ProfileController>(() => ProfileController(
        repository: ProfileRepository(apiClient: MyApiGetConnect())));
  }
}
