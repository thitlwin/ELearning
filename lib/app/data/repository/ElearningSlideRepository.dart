import 'package:elearning/app/data/model/response/ModuleCompletionResponse.dart';
import 'package:elearning/app/data/model/response/ModuleListDetailResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class ElearningSlideRepository {
  final MyApiGetConnect apiClient;

  ElearningSlideRepository({required this.apiClient});

  Future<ModuleListDetailResponse?> getModuleDslideList(
      int moduleId, String courseId, int employeeId) {
    return apiClient.getModuleDslideList(
        moduleId: moduleId, courseId: courseId, employeeId: employeeId);
  }

  Future<ModuleCompletionResponse?> markCourseAsCompleted(
      int employeeId, int courseId, int moduleId) {
    return apiClient.markCourseAsCompleted(employeeId, courseId, moduleId);
  }
}
