import 'package:auth_app_koffiesoft/domain/models/users/user_register_models.dart';

abstract class AuthenticationUsecase {
  Future<String> loginUsecase(String email, String password);
  Future<UserRegisterModels> registerUsecase(String firstName,String lastName,int? gender,String email,String phoneNumber,String password);
}