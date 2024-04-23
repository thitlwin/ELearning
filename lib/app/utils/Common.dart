import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/User.dart';
import 'package:flutter/material.dart';

void saveUserInfoToPref(User authUesr, AppPref _appPref) {
  debugPrint("saveUserInfoToPref-----");
  _appPref.token.val = authUesr.token!;
  _appPref.employeeId.val = authUesr.employeeId!;
  _appPref.email.val = authUesr.email!;
  _appPref.userName.val = authUesr.userName!;
  _appPref.requireChangePassword.val = authUesr.requireChangePassword;
}

void clearUserInforFromPref(AppPref _appPref) {
  debugPrint("clearUserInforFromPref-----");
  _appPref.token.val = "";
  _appPref.employeeId.val = 0;
  _appPref.email.val = "";
  _appPref.userName.val = "";
  _appPref.requireChangePassword.val = false;
}
