import 'package:elearning/app/data/model/response/CourseListResponse.dart';
import 'package:elearning/app/data/model/response/RegisteredCourseResponse.dart';
import 'package:elearning/app/data/model/response/ThorResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class HomeRepository {
  final MyApiGetConnect apiClient;

  HomeRepository({required this.apiClient}) : assert(apiClient != null);

  Future<RegisteredCourseResponse?> getRegisteredCourses(int employeeId) {
    return apiClient.getRegisteredCourses(employeeId: employeeId);
  }

  Future<ThorResponse?> doLogout() {
    return apiClient.doLogout();
  }
}
