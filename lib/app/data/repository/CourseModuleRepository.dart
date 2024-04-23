import 'package:elearning/app/data/model/response/ModuleListResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class CourseModuleRepository {
  final MyApiGetConnect apiClient;

  CourseModuleRepository({required this.apiClient}) : assert(apiClient != null);

  Future<ModuleListResponse?> getCourseModuleList(
      int courseId, int employeeId) {
    return apiClient.getCourseModuleList(
        courseId: courseId, employeeId: employeeId);
  }
}
