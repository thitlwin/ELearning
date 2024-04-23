import 'package:elearning/app/bindings/AssessmentBinding.dart';
import 'package:elearning/app/bindings/AssessmentResultBinding.dart';
import 'package:elearning/app/bindings/CourseListBinding.dart';
import 'package:elearning/app/bindings/CourseModuleListBinding.dart';
import 'package:elearning/app/bindings/ForgotPasswordBinding.dart';
import 'package:elearning/app/bindings/NotificationBinding.dart';
import 'package:elearning/app/bindings/ProfileBinding.dart';
import 'package:elearning/app/bindings/SettingBinding.dart';
import 'package:elearning/app/bindings/SlideBinding.dart';
import 'package:elearning/app/bindings/HomeBinding.dart';
import 'package:elearning/app/bindings/LoginingBinding.dart';
import 'package:elearning/app/bindings/RegistrationBinding.dart';
import 'package:elearning/app/bindings/TestQuestionBinding.dart';
import 'package:elearning/app/ui/assessment/AssessmentConfirmationPage.dart';
import 'package:elearning/app/ui/assessment/AssessmentQuestionPage.dart';
import 'package:elearning/app/ui/assessment/AssessmentResultPage.dart';
import 'package:elearning/app/ui/bottom_navigation/BottomNavigationPage.dart';
import 'package:elearning/app/ui/course/CourseAssessmentListPage.dart';
import 'package:elearning/app/ui/course/CourseDetailPage.dart';
import 'package:elearning/app/ui/change_password/ChangePasswordPage.dart';
import 'package:elearning/app/ui/course/UnregisteredCourseListPage.dart';
import 'package:elearning/app/ui/course/CourseModuleListPage.dart';
import 'package:elearning/app/ui/forgot_password/ForgotPasswordPage.dart';
import 'package:elearning/app/ui/forgot_password/ForgotSuccessPage.dart';
import 'package:elearning/app/ui/home/HomePage.dart';
import 'package:elearning/app/ui/login/LoginPage.dart';
import 'package:elearning/app/ui/profile/ProfilePage.dart';
import 'package:elearning/app/ui/registration/RegistrationPage.dart';
import 'package:elearning/app/ui/setting/SettingPage.dart';
import 'package:elearning/app/ui/slide/SlideImagePage.dart';
import 'package:elearning/app/ui/slide/SlideLandscapePage.dart';
import 'package:elearning/app/ui/slide/SlidePdfPage.dart';
import 'package:elearning/app/ui/slide/SlidePortraitPage.dart';
import 'package:elearning/app/ui/slide/SlideVideoLandscapePage.dart';
import 'package:elearning/app/ui/slide/SlideVideoPortraitPage.dart';
import 'package:elearning/app/ui/welcome/WelcomePage.dart';
import 'package:get/get.dart';
part 'AppRoutes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTRATION,
      page: () => RegistrationPage(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: Routes.BOTTOM_NAVIGATION,
      page: () => BottomNavigationPage(),
      bindings: [HomeBinding(), NotificationBinding()],
    ),
    GetPage(
      name: Routes.COURSE_DETAIL,
      page: () => CourseDetailPage(),
    ),
    GetPage(
      name: Routes.ELEARNING_SLIDE_PORTRAIT,
      page: () => SlidePortraitPage(),
      binding: SlideBinding(),
    ),
    GetPage(
      name: Routes.ELEARNING_SLIDE_LANDSCAPE,
      page: () => SlideLandscapePage(),
      binding: SlideBinding(),
    ),
    GetPage(
      name: Routes.ELEARNING_SLIDE_IMAGE,
      page: () => SlideImagePage(),
      binding: SlideBinding(),
    ),
    GetPage(
      name: Routes.ELEARNING_SLIDE_PDF,
      page: () => SlidePdfPage(),
      binding: SlideBinding(),
    ),
    GetPage(
      name: Routes.ELEARNING_SLIDE_VIDEO_PORTRAIT,
      page: () => SlideVideoPortraitPage(),
      binding: SlideBinding(),
    ),
    GetPage(
      name: Routes.ELEARNING_SLIDE_VIDEO_LANDSCAPE,
      page: () => SlideVideoLandscapePage(),
      binding: SlideBinding(),
    ),

    GetPage(
      name: Routes.ASSESSMENT_CONFIRMATION_PAGE,
      page: () => AssessmentConfirmationPage(),
    ),
    GetPage(
      name: Routes.ASSESSMENT_QUESTION_PAGE,
      page: () => AssessmentQuestionPage(),
      binding: TestQuestionBinding(),
    ),
    GetPage(
      name: Routes.ASSESSMENT_RESULT_PAGE,
      page: () => AssessmentResultPage(),
      binding: AssessmentResultBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.PASSWORD_REQUEST_SUCCESS,
      page: () => ForgotSuccessPage(),
    ),
    GetPage(
      name: Routes.SETTING_PAGE,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD,
      page: () => ChangePasswordPage(),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: Routes.OTP_VERIFICATION_PAGE,
    //   page: () => OTPVerificationPage(),
    // ),

    GetPage(
      name: Routes.COURSE_LIST,
      page: () => UnregisteredCourseListPage(),
      binding: CourseListBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_PAGE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.COURSE_ASSESSMENT_LIST_PAGE,
      page: () => CourseAccessmentListPage(),
      binding: AssessmentBinding(),
    ),
    GetPage(
      name: Routes.COURSE_MODULE_LIST,
      page: () => CourseModuleListPage(),
      binding: CourseModuleListBinding(),
    ),
    GetPage(
        name: Routes.PROFILE_PAGE,
        page: () => ProfilePage(),
        binding: ProfileBinding()),
  ];
}
