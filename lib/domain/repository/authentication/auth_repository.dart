import 'package:auth_app_koffiesoft/domain/models/users/user_register_models.dart';

abstract class AuthRepository {
  Future<String> login(String email, String password);
  Future<UserRegisterModels> register(String firstName,String lastName,int? gender,String email,String phoneNumber,String password);
}