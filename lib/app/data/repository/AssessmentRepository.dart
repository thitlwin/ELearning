import 'package:elearning/app/data/model/response/AssessmentModuleListResponse.dart';
import 'package:elearning/app/data/model/response/TestResultResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class AssessmentRepository {
  final MyApiGetConnect apiClient;

  AssessmentRepository({required this.apiClient}) : assert(apiClient != null);

  Future<AssessmentModuleListResponse?> getAssessmentModuleList(
      int employeeId, int courseId) {
    return apiClient.getAssessmentModuleList(
        employeeId: employeeId, courseId: courseId);
  }

  Future<TestResultResponse?> getTestResultList(int employeeId, int testId) {
    return apiClient.getTestResultList(employeeId: employeeId, testId: testId);
  }
}
