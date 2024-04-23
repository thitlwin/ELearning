part of './AppPages.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const WELCOME = '/welcome';
  static const REGISTRATION = '/registration';
  static const BOTTOM_NAVIGATION = '/bottom_navigation';
  static const COURSE_LIST = '/course_list';
  static const COURSE_DETAIL = "/course_detail";
  static const COURSE_MODULE_LIST = "/course_module_list";
  static const ELEARNING_SLIDE_PORTRAIT = "/slide_portrait";
  static const ELEARNING_SLIDE_LANDSCAPE = "/slide_landscape";
  static const ELEARNING_SLIDE_IMAGE = "/slide_image";
  static const ELEARNING_SLIDE_PDF = "/slide_pdf";
  static const ELEARNING_SLIDE_VIDEO_PORTRAIT = "/slide_video_portrait";
  static const ELEARNING_SLIDE_VIDEO_LANDSCAPE = "/slide_video_landscape";

  static const COURSE_ASSESSMENT_LIST_PAGE = "/course_assessment_list_page";
  static const ASSESSMENT_CONFIRMATION_PAGE = "/assessment_confirmation_page";
  static const ASSESSMENT_QUESTION_PAGE = "/assessment_question_page";
  static const ASSESSMENT_RESULT_PAGE = "/assessment_result_page";
  static const FORGOT_PASSWORD = '/forgot_password';
  static const PASSWORD_REQUEST_SUCCESS = '/password_request_success';
  static const SETTING_PAGE = '/setting_page';
  static const CHANGE_PASSWORD = '/change_password';
  static const PROFILE_PAGE = '/profile_page';

  // static const OTP_VERIFICATION_PAGE = '/email_verification_page';
}
