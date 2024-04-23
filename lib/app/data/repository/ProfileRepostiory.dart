import 'package:elearning/app/data/model/request/UpdateProfileRequest.dart';
import 'package:elearning/app/data/model/response/ElearningResponse.dart';
import 'package:elearning/app/data/model/response/ProfileInfoResponse.dart';
import 'package:elearning/app/data/provider/MyApiGetConnect.dart';

class ProfileRepository {
  final MyApiGetConnect apiClient;

  ProfileRepository({required this.apiClient}) : assert(apiClient != null);

  Future<ProfileInfoResponse?> getProfileInfo(int employeeId) {
    return apiClient.getProfileInfo(employeeId: employeeId);
  }

  Future<ElearningResponse?> editProfile(UpdateProfileRequest request) {
    return apiClient.editProfile(request: request);
  }
}
