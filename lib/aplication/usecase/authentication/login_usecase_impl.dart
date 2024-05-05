import 'package:auth_app_koffiesoft/domain/models/users/user_register_models.dart';
import 'package:auth_app_koffiesoft/domain/repository/authentication/auth_repository.dart';
import 'package:auth_app_koffiesoft/domain/usecase/authentication/auth_usecase.dart';

class AuthenticationUsecaseImpl implements AuthenticationUsecase {
  
  final AuthRepository _authRepository;

  AuthenticationUsecaseImpl(this._authRepository);

  @override
  Future<UserRegisterModels> registerUsecase(String firstName, String lastName,
      int? gender, String email, String phoneNumber, String password) async {
        return await _authRepository.register(firstName, lastName, gender, email, phoneNumber, password);
      }

  @override
  Future<String> loginUsecase(String email , String password) async {
    

    return await _authRepository.login(email, password);
  }

}