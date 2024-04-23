import 'package:elearning/app/controller/RegistrationController.dart';
import 'package:elearning/app/data/model/Company.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';
import 'package:elearning/app/data/repository/RegisterationRepository.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends GetView<RegistrationController> {
  final _registerationPageFormKey = GlobalKey<FormState>();
  final _textFieldControllerForUsername = TextEditingController(text: "");
  final _textFieldControllerForFullname = TextEditingController(text: "");
  final _textFieldControllerForEmail = TextEditingController(text: "");
  final _textFieldControllerForPassword = TextEditingController(text: "");
  final _textFieldControllerForEmployeeCode = TextEditingController(text: "");
  final _textFieldControllerForCompany = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Get.lazyPut<RegistrationController>(() => RegistrationController(
        repository: RegisterationRepository(apiClient: MyApiGetConnect())));
    // List<Company> _companyList;
    // _companyList = controller.companyList;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      body: Container(
        height: size.height,
        width: double.infinity,
        // Here i can use size.width but use double.infinity because both work as a same
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/signup_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.25,
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _registerationPageFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create an Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextFormField(
                            // style: themeData.textTheme.bodyText1,
                            decoration: InputDecoration(
                              hintText: "Username",
                              // hintStyle: themeData.textTheme.bodyText1,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: themeData.colorScheme.primaryVariant,
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            controller: _textFieldControllerForUsername,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Username is required.";
                              return null;
                            },
                            // textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextFormField(
                            // style: themeData.textTheme.bodyText1,
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              // hintStyle: themeData.textTheme.bodyText1,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: themeData.colorScheme.primaryVariant,
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            controller: _textFieldControllerForFullname,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Full name is required.";
                              return null;
                            },
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextFormField(
                            // style: themeData.textTheme.bodyText1,
                            decoration: InputDecoration(
                              hintText: "Employee Code (Optional)",
                              // hintStyle: themeData.textTheme.bodyText1,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: themeData.colorScheme.primaryVariant,
                              prefixIcon: Icon(
                                Icons.ac_unit_outlined,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            controller: _textFieldControllerForEmployeeCode,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextFormField(
                            // style: themeData.textTheme.bodyText1,
                            decoration: InputDecoration(
                              // hintStyle: themeData.textTheme.bodyText1,
                              hintText: "Email address",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: themeData.colorScheme.primaryVariant,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            controller: _textFieldControllerForEmail,
                            validator: (value) {
                              if (value!.isEmpty) return "Email is required.";
                              if (!value.isEmail)
                                return "Invalid email address.";
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Obx(
                          () => Container(
                            margin: EdgeInsets.only(top: 16),
                            child: TextFormField(
                              // style: themeData.textTheme.bodyText1,
                              obscureText: controller.passwordVisible.value,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: themeData.colorScheme.primaryVariant,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 22,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.passwordVisible.value =
                                        !controller.passwordVisible.value;
                                  },
                                  child: Icon(
                                    controller.passwordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off_outlined,
                                    size: 22,
                                  ),
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(0),
                              ),
                              controller: _textFieldControllerForPassword,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Password is required.";
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 16.0),
                            child: TextFormField(
                              controller: _textFieldControllerForCompany,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Company is required.";
                                } else {
                                  var company = controller.companyList
                                      .where((Company option) {
                                    //   debugPrint(
                                    // "option.companyName-----${option.companyName}");
                                    return option.companyName
                                            .toString()
                                            .trim()
                                            .toLowerCase() ==
                                        value.toString().trim().toLowerCase();
                                  });
                                  // debugPrint(
                                  //     "company-----${company.length}");
                                  if (company.length == 0) {
                                    return "This company does not exist.";
                                  } else {
                                    controller.selectedCompany = company.first;
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Company",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: themeData.colorScheme.primaryVariant,
                                prefixIcon: Icon(
                                  Icons.home,
                                  size: 22,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(0),
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 24),
                          child: RoundedButton(
                            color: themeData.colorScheme.primary,
                            onPressed: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              if (_registerationPageFormKey.currentState!
                                  .validate()) {
                                controller.userName =
                                    _textFieldControllerForUsername.text;
                                controller.fullName =
                                    _textFieldControllerForFullname.text;
                                controller.email =
                                    _textFieldControllerForEmail.text;
                                controller.password =
                                    _textFieldControllerForPassword.text;
                                controller.employeeCode =
                                    _textFieldControllerForEmployeeCode.text;
                                controller.makeRegisteration();
                                // Get.offAndToNamed(Routes.OTP_PAGE);
                              }
                            },
                            text: "Create Account",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.LOGIN);
                              },
                              child: Text("Already had an account?"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
