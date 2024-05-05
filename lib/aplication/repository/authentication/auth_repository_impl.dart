import 'package:auth_app_koffiesoft/constant/api/endpoint_api_constant.dart';
import 'package:auth_app_koffiesoft/constant/path/dotenv_string_constant.dart';
import 'package:auth_app_koffiesoft/constant/shared_pref_key_constant.dart';
import 'package:auth_app_koffiesoft/core/network/api_client.dart';
import 'package:auth_app_koffiesoft/domain/models/users/user_login_models.dart';
import 'package:auth_app_koffiesoft/domain/models/users/user_register_models.dart';
import 'package:auth_app_koffiesoft/domain/repository/authentication/auth_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient = ApiClient(dotenv.get(DotenvStringConstant.apiKey));

  @override
  Future<UserRegisterModels> register(
    String firstName, String lastName,
      int? gender, String email, String phoneNumber, String password) async {
    try {

      UserRegisterModels registerUser = UserRegisterModels(
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          email: email,
          phoneNumber: phoneNumber,
          password: password);
      Map<String, dynamic> userToJson = registerUser.toJson();

      final response = await _apiClient.postJson(EndpointApiConstant.users, body: userToJson);

     UserRegisterModels responseCre =  UserRegisterModels.fromJson(response['data']);
      return responseCre;
    } catch (e) {
      throw Error();
    }
  }

  @override
  Future<String> login(email, String password) async {
    try {
      UserLoginModels loginUser =
          UserLoginModels(email: email, password: password);
      Map<String, dynamic> userToJson = loginUser.toJson();
      late String accessToken;
      final response =
          await _apiClient.postUrlEncode(EndpointApiConstant.login, body: userToJson);
      // print(response);
      accessToken = response[SharedPrefKey.accessToken];
      return accessToken;
    } catch (e) {
      throw Error();
    }
  }
}
