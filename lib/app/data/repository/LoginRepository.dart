import 'package:elearning/app/data/model/request/ChangePasswordRequest.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:elearning/app/data/model/response/LoginResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class LoginRepository {
  final MyApiGetConnect apiClient;

  LoginRepository(this.apiClient);

  Future<LoginResponse?> doLogin(String email, String password) {
    return apiClient.postLogin(userName: email, password: password);
  }

  Future<ElearningResponse?> changePassword(ChangePasswordRequest request) {
    return apiClient.changePassword(request: request);
  }
}
