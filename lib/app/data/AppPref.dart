import 'package:elearning/app/data/model/AssessmentModule.dart';
import 'package:elearning/app/data/model/Course.dart';
import 'package:get_storage/get_storage.dart';

class AppPref {
  static final prefBoxName = "E-LearningAppPref";
  static final _elearningPrefBox = () => GetStorage(prefBoxName);
  // final ReadWriteValue<String?> sessionId =
  //     ReadWriteValue('token', "", _elearningPrefBox);
  // final authUser = ReadWriteValue<User?>('user', null, _elearningPrefBox);
  // final module = ReadWriteValue<Module?>('module', null, _elearningPrefBox);
  final moduleId = 0.val('moudleId', getBox: _elearningPrefBox);
  final moduleNo = 0.val('moudleNo', getBox: _elearningPrefBox);
  final courseID = ''.val('courseID', getBox: _elearningPrefBox);
  // final learningModeId = 0.val('learningModeId', getBox: _elearningPrefBox);
  final employeeId = 0.val('employeeId', getBox: _elearningPrefBox);
  final email = ''.val('email', getBox: _elearningPrefBox);
  final forgotEmail = ''.val('forgotEmail', getBox: _elearningPrefBox);
  final userName = ''.val('userName', getBox: _elearningPrefBox);
  final token = ''.val('sessionToken', getBox: _elearningPrefBox);
  final courseId = 0.val('courseId', getBox: _elearningPrefBox);
  final testId = 0.val('testId', getBox: _elearningPrefBox);
  final requireChangePassword =
      false.val("requireChangePassword", getBox: _elearningPrefBox);

  final displayNotification =
      true.val('displayNotification', getBox: _elearningPrefBox);
  final playNotiSound = true.val('playNotiSound', getBox: _elearningPrefBox);
  final assessmentModule = ReadWriteValue<AssessmentModule?>(
      'assessmentModule', null, _elearningPrefBox);
}
