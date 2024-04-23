import 'package:elearning/app/data/model/response/CourseListResponse.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class CourseRepository {
  final MyApiGetConnect apiClient;

  CourseRepository({required this.apiClient}) : assert(apiClient != null);

  Future<CourseListResponse?> getCourseList(int employeeId) {
    return apiClient.getCourseList(employeeId: employeeId);
  }

  Future<ElearningResponse?> registerCourse(int courseId, int employeeId) {
    return apiClient.registerCourse(courseId: courseId, employeeId: employeeId);
  }
}
