import 'package:elearning/app/data/model/response/LoginResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class OTPVerificationRepository {
  final MyApiGetConnect apiClient;

  OTPVerificationRepository({required this.apiClient});

  requestOtpCode(email) {
    return apiClient.requestOtpCode(email: email);
  }

  Future<LoginResponse?> submitVerificationCode(String email, String otpCode) {
    return apiClient.submitOtpCode(email: email, otpCode: otpCode);
  }

  requestNewPassword(String emailAddress, String code) {
    return apiClient.requestNewPassword(email: emailAddress, code: code);
  }
}
