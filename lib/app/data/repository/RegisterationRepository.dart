import 'package:elearning/app/data/model/request/RegisterationRequest.dart';
import 'package:elearning/app/data/model/response/CompanyResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class RegisterationRepository {
  final MyApiGetConnect apiClient;

  RegisterationRepository({required this.apiClient})
      : assert(apiClient != null);

  Future<CompanyResponse?> getCompanyList() {
    return apiClient.getCompanyList();
  }

  makeRegisteration(RegisterationRequest request) {
    try {
      return apiClient.makeRegisteration(request);
    } catch (e) {
      throw e;
    }
  }
}
