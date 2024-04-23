import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:elearning/app/data/AppPref.dart';
import 'package:elearning/app/data/model/request/AnswerListRequest.dart';
import 'package:elearning/app/data/model/request/ChangePasswordRequest.dart';
import 'package:elearning/app/data/model/request/UpdateProfileRequest.dart';
import 'package:elearning/app/data/model/response/AssessmentModuleListResponse.dart';
import 'package:elearning/app/data/model/response/AssessmentTestQuestionResponse.dart';
import 'package:elearning/app/data/model/response/CourseListResponse.dart';
import 'package:elearning/app/data/model/response/LoginResponse.dart';
import 'package:elearning/app/data/model/request/RegisterationRequest.dart';
import 'package:elearning/app/data/model/response/CompanyResponse.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:elearning/app/data/model/response/ModuleCompletionResponse.dart';
import 'package:elearning/app/data/model/response/ModuleListDetailResponse.dart';
import 'package:elearning/app/data/model/response/ModuleListResponse.dart';
import 'package:elearning/app/data/model/response/NotificationResponse.dart';
import 'package:elearning/app/data/model/response/ProfileInfoResponse.dart';
import 'package:elearning/app/data/model/response/RegisteredCourseResponse.dart';
import 'package:elearning/app/data/model/response/SubmitAnswerResponse.dart';
import 'package:elearning/app/data/model/response/TestResultResponse.dart';
import 'package:elearning/app/data/model/response/ThorResponse.dart';
import 'package:elearning/app/data/provider/EndPoint.dart';
import 'package:elearning/app/data/provider/LoggingInterceptor.dart';
import 'package:elearning/app/exceptions/ElearningAppExceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:get/get.dart';

var options = BaseOptions(
  baseUrl: '${EndPoint.BASE_RUL}',
  connectTimeout: 60000,
  receiveTimeout: 10000,
);

class MyApiGetConnect {
  final Dio dio = Dio(options);
  var _pref = Get.put(AppPref());

  MyApiGetConnect() {
    dio.interceptors.add(LoggingInterceptor());
    options.headers["Authorization"] = "Bearer " + _pref.token.val.toString();
  }

  Future<LoginResponse?> postLogin(
      {required String userName, required String password}) async {
    try {
      return dio.post(
        EndPoint.LOGIN,
        data: {"userName": userName, "password": password},
      ).then((value) {
        debugPrint('value=>$value');
        debugPrint('value.statusCode =>${value.statusCode}');
        if (value.statusCode == 200) {
          debugPrint('value is 200');
          LoginResponse loginResponse = LoginResponse.fromJson(value.data[0]);
          debugPrint(loginResponse.toJson().toString());
          return loginResponse;
        }
      }).onError((error, stackTrace) {
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<CompanyResponse?> getCompanyList() async {
    try {
      var response = dio.get(
        EndPoint.GET_COMPANY_LIST,
        queryParameters: {},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          CompanyResponse companyResponse =
              CompanyResponse.fromJson(value.data[0]);
          return companyResponse;
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<ElearningResponse?> makeRegisteration(
      RegisterationRequest request) async {
    try {
      print('make registeration------------');
      debugPrint(request.toJson().toString());
      return await dio
          .post(EndPoint.REGISTERATION, data: json.encode(request))
          .then((value) {
        if (value.statusCode == 200) {
          debugPrint(
              'value.statusCode of make registeration=${value.statusCode}');
          debugPrint('value.body of make registeration=${value.data}');
          return ElearningResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        throw error.toString();
      });
    } catch (e) {
      throw e;
    }
  }

  Future<LoginResponse?> submitOtpCode(
      {required String email, required String otpCode}) async {
    try {
      var params = {"email": email, "code": otpCode};
      return await dio
          .post(EndPoint.VERIFY_OTP_CODE, queryParameters: params)
          .then((value) {
        if (value.statusCode == 200) {
          return LoginResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        throw error.toString();
      });
    } catch (e) {
      throw e;
    }
  }

  Future<ThorResponse?> requestOtpCode({required String email}) async {
    try {
      var params = {"email": email};
      return await dio
          .post(EndPoint.REQUEST_OTP_CODE, queryParameters: params)
          .then((value) {
        if (value.statusCode == 200) {
          return ThorResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        throw error.toString();
      });
    } catch (e) {
      throw e;
    }
  }

  Future<ThorResponse?> requestNewPassword(
      {required String email, required String code}) async {
    try {
      var params = {"email": email, "code": code};
      return await dio
          .post(EndPoint.REQUEST_NEW_PASSWORD, queryParameters: params)
          .then((value) {
        if (value.statusCode == 200) {
          return ThorResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        throw error.toString();
      });
    } catch (e) {
      throw e;
    }
  }

  Future<CourseListResponse?> getCourseList({required int employeeId}) async {
    try {
      var response = dio.get(
        EndPoint.COURSE_LIST,
        queryParameters: {"EmployeeId": employeeId},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          CourseListResponse courseListResponse =
              CourseListResponse.fromJson(value.data[0]);
          return courseListResponse;
        }
      }).onError((error, stackTrace) {
        throw error!;
      });
    } on IOException catch (e) {
      throw NetworkException(e.toString());
    }
  }

  Future<ModuleListResponse?> getCourseModuleList(
      {required int courseId, required int employeeId}) async {
    try {
      var response = dio.get(
        EndPoint.MODULE_SLIDES_LIST,
        queryParameters: {"courseId": courseId, "employeeId": employeeId},
      );
      return await response.then((value) {
        // print(value);
        if (value.statusCode == 200) {
          ModuleListResponse moduleListResponse =
              ModuleListResponse.fromJson(value.data[0]);
          debugPrint('GetCourseModuleList====> ${value.data[0]}');
          return moduleListResponse;
        }
      }).onError((error, stackTrace) {
        throw error!;
      });
    } on IOException catch (e) {
      throw NetworkException(e.toString());
    }
  }

  Future<ModuleListDetailResponse?> getModuleDslideList(
      {required int moduleId,
      required String courseId,
      required int employeeId}) async {
    try {
      var response = dio.get(
        EndPoint.MODULE_SLIDES_DETAIL,
        queryParameters: {
          "moduleId": moduleId,
          "courseId": courseId,
          "employeeId": employeeId
        },
      );
      return await response.then((value) {
        // print(value);
        if (value.statusCode == 200) {
          // debugPrint('Slide====> ${value.data[0]}');
          ModuleListDetailResponse moduleListResponse =
              ModuleListDetailResponse.fromJson(value.data[0]);

          return moduleListResponse;
        } else {
          throw Exception();
        }
      }).onError((error, stackTrace) {
        throw error!;
      });
    } on IOException catch (e) {
      throw NetworkException(e.toString());
    }
  }

  Future<ElearningResponse?> registerCourse(
      {required int courseId, required int employeeId}) async {
    try {
      var response = dio.post(
        EndPoint.REGISTER_COURSE,
        queryParameters: {"EmployeeId": employeeId, "courseId": courseId},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          ElearningResponse elearningResponse =
              ElearningResponse.fromJson(value.data[0]);
          debugPrint('value.statusCode course register=${value.statusCode}');
          debugPrint('value.body course register=${value.data}');
          return elearningResponse;
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<RegisteredCourseResponse?> getRegisteredCourses(
      {required int employeeId}) async {
    try {
      var response = dio.get(
        EndPoint.REGISTERED_COURSE,
        queryParameters: {"EmployeeId": employeeId},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          RegisteredCourseResponse registeredCourseResponse =
              RegisteredCourseResponse.fromJson(value.data[0]);
          debugPrint('value.statusCode course list=${value.statusCode}');
          debugPrint('value.body course list=${value.data}');
          return registeredCourseResponse;
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<ProfileInfoResponse?> getProfileInfo({required int employeeId}) async {
    try {
      // options.headers["Authorization"] = "Bearer " + token;
      var response = dio.get(
        EndPoint.GET_PROFILE_INFO,
        queryParameters: {"EmployeeId": employeeId},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          ProfileInfoResponse profileInfoResponse =
              ProfileInfoResponse.fromJson(value.data[0]);
          debugPrint('value.statusCode profile info=${value.statusCode}');
          debugPrint('value.body profile info=${value.data}');
          return profileInfoResponse;
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<ElearningResponse?> editProfile(
      {required UpdateProfileRequest request}) async {
    try {
      print('edit profile------------');
      debugPrint(request.toJson().toString());
      return await dio
          .put(EndPoint.EDIT_PROFILE, data: json.encode(request))
          .then((value) {
        if (value.statusCode == 200) {
          debugPrint('value.statusCode profile edit=${value.statusCode}');
          debugPrint('value.body profile edit=${value.data}');
          return ElearningResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<ElearningResponse?> changePassword(
      {required ChangePasswordRequest request}) async {
    try {
      print('change password ------------');
      debugPrint(request.toJson().toString());
      return await dio
          .post(EndPoint.CHANGE_PASWORD, data: json.encode(request))
          .then((value) {
        if (value.statusCode == 200) {
          debugPrint('value.statusCode change password=${value.statusCode}');
          debugPrint('value.body change password=${value.data}');
          return ElearningResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<AssessmentModuleListResponse?> getAssessmentModuleList(
      {required int employeeId, required int courseId}) async {
    try {
      var response = dio.get(
        EndPoint.ASSESSMENT_MODULE_LIST,
        queryParameters: {"employeeId": employeeId, "courseId": courseId},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          debugPrint(
              'value code of assessment module list=${value.statusCode}');
          debugPrint('value body of assessment module list=${value.data}');
          AssessmentModuleListResponse assessmentModuleListResponse =
              AssessmentModuleListResponse.fromJson(value.data[0]);
          return assessmentModuleListResponse;
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<NotificationResponse?> getNotificationList(
      {required int employeeId}) async {
    try {
      var response = dio.get(
        EndPoint.NOTIFICATION_REQUEST,
        queryParameters: {"employeeId": employeeId},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          NotificationResponse notfiResponse =
              NotificationResponse.fromJson(value.data[0]);
          return notfiResponse;
        }
      }).onError((error, stackTrace) {
        throw error!;
      });
    } on IOException catch (e) {
      throw NetworkException(e.toString());
    }
  }

  Future<AssessmentTestQuestionResponse?> getTestQuestion(
      {required int testId, required int employeeId}) async {
    try {
      var response = dio.get(
        EndPoint.ASSESSMENT_TEST_QUESTION,
        queryParameters: {"testId": testId, "employeeId": employeeId},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          AssessmentTestQuestionResponse questionResponse =
              AssessmentTestQuestionResponse.fromJson(value.data[0]);
          debugPrint('value.statusCode question list=${value.statusCode}');
          debugPrint('value.body question list=${value.data}');
          return questionResponse;
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<SubmitAnswerResponse?> makeAssessmentAnswerSubmit(
      AnswerListRequest request, int employeeId) async {
    try {
      print('make registeration------------');
      debugPrint(request.toJson().toString());
      return await dio
          .post(EndPoint.MAKE_SUBMIT_ANSWER_LIST,
              queryParameters: {"employeeId": employeeId},
              data: json.encode(request.dataList))
          .then((value) {
        if (value.statusCode == 200) {
          debugPrint(
              'make submit answer list from api connect=${value.statusCode}');
          debugPrint('make submit answer list from api connect=${value.data}');
          return SubmitAnswerResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        throw error.toString();
      });
    } catch (e) {
      throw e;
    }
  }

  Future<TestResultResponse?> getTestResultList(
      {required int employeeId, required int testId}) async {
    try {
      var response = dio.get(
        EndPoint.GET_TEST_RESULT,
        queryParameters: {"employeeId": employeeId, "testId": testId},
      );
      return await response.then((value) {
        if (value.statusCode == 200) {
          debugPrint('value code of test result=${value.statusCode}');
          debugPrint('value body of test result=${value.data}');
          TestResultResponse testReultResponse =
              TestResultResponse.fromJson(value.data[0]);
          return testReultResponse;
        }
      }).onError((error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        print(error);
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<ThorResponse?> doLogout() async {
    try {
      return dio.post(EndPoint.LOGOUT).then((value) {
        if (value.statusCode == 200) {
          return ThorResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }

  Future<ModuleCompletionResponse?> markCourseAsCompleted(
      int employeeId, int courseId, int moduleId) async {
    try {
      return dio.post(EndPoint.MARK_COURSE_AS_COMPLETED, queryParameters: {
        "employeeId": employeeId,
        "courseId": courseId,
        "moduleId": moduleId
      }).then((value) {
        if (value.statusCode == 200) {
          return ModuleCompletionResponse.fromJson(value.data[0]);
        }
      }).onError((error, stackTrace) {
        throw error!;
      });
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException(e.toString());
    }
  }
}
