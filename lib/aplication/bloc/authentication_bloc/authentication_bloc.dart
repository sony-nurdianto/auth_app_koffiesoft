import 'package:auth_app_koffiesoft/constant/shared_pref_key_constant.dart';
import 'package:auth_app_koffiesoft/core/local/shared_pref_helper.dart';
import 'package:auth_app_koffiesoft/domain/models/users/user_login_models.dart';
import 'package:auth_app_koffiesoft/domain/models/users/user_register_models.dart';
import 'package:auth_app_koffiesoft/domain/usecase/authentication/auth_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final AuthenticationUsecase authenticationUsecase;

  AuthenticationBloc(this.authenticationUsecase) : super(AuthenticationInitial()) {
   on<AuthenticationLogin>((event, emit) async {
     try {
      emit(AuthenticationLoading());
      UserLoginModels requestData = event.userLoginModels;
      String accessToken = await authenticationUsecase.loginUsecase(requestData.email, requestData.password);
      await SharedPreferenceHelper().saveString(SharedPrefKey.accessToken, accessToken);
      //  AuthService().login(accessToken);
       emit( AuthenticationSuccess());
     } catch (e) {
       emit(AuthenticationFailure());
     }
   },);
   on<AuthenticationRegister>((event, emit) async{
    try {
      emit(AuthenticationLoading());
      UserRegisterModels eventRequest = event.userRegisterModels;
        // print('dapet data dari bloc');
        await authenticationUsecase.registerUsecase(
         eventRequest.firstName,eventRequest.lastName,eventRequest.gender,eventRequest.email,eventRequest.phoneNumber,eventRequest.password
        );
       emit(AuthenticationSuccess()); 
    } catch (e) {
      // print('ini error');
      emit(AuthenticationFailure());
    }
   },);
   
  }

  bool isAuthenticated() => state is AuthenticationSuccess;
}
