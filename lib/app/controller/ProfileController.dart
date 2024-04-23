import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/ProfileInfo.dart';
import 'package:elearning/app/data/model/request/UpdateProfileRequest.dart';
import 'package:elearning/app/data/repository/ProfileRepostiory.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileRepository repository;
  ProfileController({required this.repository}) : assert(repository != null);

  final _contactMobile = ''.obs;
  set contactMobile(value) => this._contactMobile.value = value;
  get contactMobile => this._contactMobile.value;

  final _address = ''.obs;
  set address(value) => this._address.value = value;
  get address => this._address.value;

  final _employeeCode = ''.obs;
  set employeeCode(value) => this._employeeCode.value = value;
  get employeeCode => this._employeeCode.value;

  final _fullName = ' '.obs;
  set fullName(value) => this._fullName.value = value;
  get fullName => this._fullName.value;

  final _email = ''.obs;
  set email(value) => this._email.value = value;
  get email => this._email.value;

  final _profileInfo = ProfileInfo().obs;
  get profileInfo => this._profileInfo.value;
  set profileInfo(value) => this._profileInfo.value = value;

  var _pref = Get.put(AppPref());

  @override
  void onInit() {
    final employeeId = _pref.employeeId;
    print('-----onInit @ controller-------');
    print("====--->${employeeId.val}");
    _preloadProfileInfo(employeeId.val);
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady @ controller-------');
    super.onReady();
  }

  void _preloadProfileInfo(int employeeId) {
    EasyLoading.show(status: 'Loading...');
    repository.getProfileInfo(employeeId).then((value) {
      if (value!.responseCode.toString() == "1") {
        fullName = value.profileInfo.employeeName;
        contactMobile = value.profileInfo.contactMobile;
        address = value.profileInfo.address;
        email = value.profileInfo.email;
        profileInfo = value.profileInfo;
        value.profileInfo.employeeCode == null
            ? employeeCode = "0"
            : employeeCode = value.profileInfo.employeeCode;
        EasyLoading.dismiss();
      } else {
        EasyLoading.showError(value.responseMessage.toString());
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError("Something wrong.");
    });
  }

  void editProfile() {
    EasyLoading.show(status: 'Loading...');
    var request = UpdateProfileRequest(
      employeeId: _pref.employeeId.val,
      contactMobile: "$_contactMobile",
      address: "$_address",
    );
    repository.editProfile(request).then((value) {
      if (value!.responseCode.toString() == "1") {
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Successfully updated.");
      } else {
        EasyLoading.showError(value.responseMessage.toString());
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError("Something wrong.");
    });
  }
}
