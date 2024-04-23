abstract class EndPoint {
  // static const BASE_RUL = 'http://asgardianlabs1-001-site3.itempurl.com/';
  static const BASE_RUL = 'https://www.soteria-vlearn.com/';
  static const AGENCY_LOGIN = "api/getSiteList";
  static const LOGIN = "api/users/login";
  static const SITE_LOGGING_IN = "api/siteLogin";
  static const GET_COMPANY_LIST = "api/company/getList";
  static const REGISTERATION = "api/users/register";
  static const REQUEST_NEW_PASSWORD = "api/users/ResetPassword";
  static const COURSE_LIST = "api/course/RegisterForCourses";
  static const REGISTER_COURSE = "api/course/register";
  static const REGISTERED_COURSE = "api/course/RegisteredCourses";
  static const GET_PROFILE_INFO = 'api/users/getprofile';
  static const EDIT_PROFILE = 'api/users/editprofile';
  static const CHANGE_PASWORD = 'api/users/changePassword';

  static const REQUEST_OTP_CODE = '/api/users/SendVerificationCode';
  static const VERIFY_OTP_CODE = "api/users/verify";
  static const ASSESSMENT_MODULE_LIST = "api/courseModule/getModuleAssessments";
  static const MODULE_SLIDES_LIST = "api/courseModule/getModuleSlides";
  static const MODULE_SLIDES_DETAIL = "api/courseModule/getModuleDetail";

  static const String NOTIFICATION_REQUEST = "api/Notification/getNotification";

  static const ASSESSMENT_TEST_QUESTION = "api/TestAssessment/getTestQuestions";
  static const MAKE_SUBMIT_ANSWER_LIST = "api/TestAssessment/SubmitAnswerLists";
  static const GET_TEST_RESULT = "api/TestAssessment/TestResult";

  static const LOGOUT = "/api/users/logout";
  static const MARK_COURSE_AS_COMPLETED = "/api/courseModule/MarkAsCompleted";
}
