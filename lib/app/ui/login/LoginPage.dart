import 'package:elearning/app/controller/LoginController.dart';
import 'package:elearning/app/routes/AppPages.dart';
import 'package:elearning/app/ui/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  final textEditingControllerForEmail = TextEditingController(text: "");
  final textEditingControllerForPassword = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: themeData.backgroundColor,
        body: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: size.width * 0.4,
                ),
              ),
              SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Center(
                      child: Column(
                        // shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            child: Center(
                                child: Text("Welcome!",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username or email is required.";
                                }
                                //  else if (!value.isEmail)
                                //   return "Invalid email address.";
                              },
                              controller: textEditingControllerForEmail,
                              decoration: InputDecoration(
                                hintText: "Username",
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
                                  Icons.person,
                                  size: 22,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(0),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              // textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                          Obx(
                            () => Container(
                              margin: EdgeInsets.only(top: 16),
                              child: TextFormField(
                                controller: textEditingControllerForPassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is required.";
                                  }
                                },
                                autofocus: false,
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
                                  fillColor:
                                      themeData.colorScheme.primaryVariant,
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
                                // textCapitalization:TextCapitalization.sentences,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          RoundedButton(
                            key: UniqueKey(),
                            text: "SIGN IN",
                            color: themeData.colorScheme.primary,
                            onPressed: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              if (_formKey.currentState!.validate()) {
                                controller.doLogin(
                                    textEditingControllerForEmail.text,
                                    textEditingControllerForPassword.text);
                              }
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.FORGOT_PASSWORD);
                              },
                              child: Text("Forgot Password ?"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            alignment: Alignment.center,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  Get.toNamed(Routes.REGISTRATION);
                                },
                                child: Text("Sign Up"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
