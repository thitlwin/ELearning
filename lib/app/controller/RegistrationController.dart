import 'package:elearning/app/data/model/Company.dart';
import 'package:elearning/app/data/model/request/RegisterationRequest.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:elearning/app/data/repository/RegisterationRepository.dart';
import 'package:elearning/app/ui/otp_verification/OTPVerificatioDialogForRegistration.dart';
import 'package:elearning/app/utils/StringUtil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final RegisterationRepository repository;
  RegistrationController({required this.repository});

  var passwordVisible = true.obs;

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  final _companyList = Rx<List<Company>>([]);
  get companyList => this._companyList.value;
  set companyList(value) => this._companyList.value = value;

  final _selectedCompany = Company().obs;
  get selectedCompany => this._selectedCompany.value;
  set selectedCompany(value) => this._selectedCompany.value = value;

  final _userName = ''.obs;
  get userName => this._userName.value;
  set userName(value) => this._userName.value = value;

  final _fullName = ''.obs;
  get fullName => this._fullName.value;
  set fullName(value) => this._fullName.value = value;

  final _email = ''.obs;
  get email => this._email.value;
  set email(value) => this._email.value = value;

  final _password = ''.obs;
  get password => this._password.value;
  set password(value) => this._password.value = value;

  final _employeeCode = ''.obs;
  get employeeCode => this._employeeCode.value;
  set employeeCode(value) => this._employeeCode.value = value;

  @override
  void onInit() {
    _loadCompanyList();
    super.onInit();
  }

  void _loadCompanyList() {
    EasyLoading.show(status: "Loading...", dismissOnTap: false);
    repository.getCompanyList().then((companyResponse) {
      if (companyResponse!.responseCode == "1" ||
          companyResponse.responseCode == "3") {
        companyList = companyResponse.companyList;
        if (EasyLoading.isShow) EasyLoading.dismiss();
      }
    }).onError((error, stackTrace) {
      EasyLoading.showError(error.toString());
    });
  }

  void makeRegisteration() async {
    EasyLoading.show(status: "Please wait...", dismissOnTap: false);
    if (selectedCompany != null) {
      Company c = (selectedCompany as Company);
      var request = RegisterationRequest(
        userName: userName,
        email: email,
        password: password,
        fullName: fullName,
        companyId: c.companyId.toString(),
        employeeCode: employeeCode,
      );
      try {
        ElearningResponse response =
            await repository.makeRegisteration(request);
        if (response.responseCode == '1') {
          // Get.offAndToNamed(Routes.OTP_VERIFICATION_PAGE, arguments: email);
          EasyLoading.dismiss();
          Get.defaultDialog(
              barrierDismissible: false,
              title: "",
              content: otpVerificationDialogForRegistration(email));
        } else {
          EasyLoading.showError('${response.responseMessage}');
        }
      } catch (e) {
        EasyLoading.showError(unknownErrorMessage);
      }
    }
  }
}
