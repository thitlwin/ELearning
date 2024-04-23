import 'package:elearning/app/data/model/request/AnswerListRequest.dart';
import 'package:elearning/app/data/model/response/AssessmentTestQuestionResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class TestQuestionRepository {
  final MyApiGetConnect apiClient;

  TestQuestionRepository({required this.apiClient}) : assert(apiClient != null);

  Future<AssessmentTestQuestionResponse?> getTestQuestion(int testId, int employeeId) {
    return apiClient.getTestQuestion(testId: testId, employeeId: employeeId);
  }

  makeAssessmentAnswerSubmit(AnswerListRequest request, int employeeId) {
    try {
      return apiClient.makeAssessmentAnswerSubmit(request, employeeId);
    } catch (e) {
      throw e;
    }
  }
}
