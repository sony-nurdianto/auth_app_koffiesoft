import 'package:auth_app_koffiesoft/aplication/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:auth_app_koffiesoft/aplication/repository/authentication/auth_repository_impl.dart';
import 'package:auth_app_koffiesoft/aplication/usecase/authentication/login_usecase_impl.dart';
import 'package:auth_app_koffiesoft/constant/formText/form_text_constant.dart';
import 'package:auth_app_koffiesoft/constant/path/assets_path_constatant.dart';
import 'package:auth_app_koffiesoft/constant/routes_path_constant.dart';
import 'package:auth_app_koffiesoft/constant/screens/login_text.dart';
import 'package:auth_app_koffiesoft/constant/widget/dialog_constant.dart';
import 'package:auth_app_koffiesoft/domain/models/users/user_login_models.dart';
import 'package:auth_app_koffiesoft/presentation/widgets/custom_dialog_info.dart';
import 'package:auth_app_koffiesoft/presentation/widgets/custom_elevated_button.dart';
import 'package:auth_app_koffiesoft/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  //userNameProperties
  final TextEditingController _textControllerEmail = TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();

  //passwordProperties
  final TextEditingController _textControllerPassword = TextEditingController();
  final FocusNode _focusNodePassword = FocusNode();

  late AuthenticationBloc _authenticationBloc;

  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _authenticationBloc =
        AuthenticationBloc(AuthenticationUsecaseImpl(AuthRepositoryImpl()));
  }

  @override
  void dispose() {
    _textControllerEmail.dispose();
    _focusNodeEmail.dispose();
    _textControllerPassword.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => _authenticationBloc,
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLoading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
          }
          if (state is AuthenticationSuccess) {
            customShowDialogInfo(context,
                dialgoText: DialogConstant.successLogin,
                icon: Icons.check,
                backgroundColor: Colors.white,
                iconColor: Colors.green);
            Future.delayed(const Duration(milliseconds: 800), () {
              Navigator.pop(context);
              setState(() {
                context.go(RoutePathConstant.homeRoutePath);
              });
            });
          }
          if (state is AuthenticationFailure) {
            customShowDialogInfo(context,
                dialgoText: DialogConstant.failedLogin,
                icon: Icons.close,
                backgroundColor: Colors.white);
            Future.delayed(const Duration(milliseconds: 800), () {
              Navigator.pop(context);
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: DecoratedBox(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(AssetPathConstant.bgImage),
                  fit: BoxFit.cover,
                )),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              LoginTextConstant.welcomeLogin,
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              LoginTextConstant.loginDescription,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                  minWidth: 300, maxWidth: 500),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: _textControllerEmail,
                                    focusNode: _focusNodeEmail,
                                    borderRadius: 30.0,
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icons.email_outlined,
                                    hintText: FormTextConstant.hintTextEmail,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return FormTextConstant.validateFieldEmpty;
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    controller: _textControllerPassword,
                                    focusNode: _focusNodePassword,
                                    borderRadius: 30.0,
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icons.lock_rounded,
                                    obscureText: !isPasswordVisible,
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                      child: isPasswordVisible
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                    ),
                                    hintText: FormTextConstant.hintTextPassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return FormTextConstant.validateFieldEmpty;
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Flexible(
                                        flex: 2,
                                        child:  Text(
                                          LoginTextConstant.askAcount,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            context.go(RoutePathConstant
                                                .registerRoutePath);
                                          },
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(bottom: 2),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                              bottom: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 228, 142, 14),
                                                width: 1,
                                              ),
                                            )),
                                            child: const Text(
                                              LoginTextConstant.register,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 228, 142, 14),
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 55,
                            ),
                            CustomElevatedButton(
                              minWidth: 300,
                              maxWidth: 500,
                              height: 60,
                              backgroundColor:
                                  const Color.fromARGB(255, 19, 150, 21),
                              buttonTextSize: 23,
                              buttonTextColors: Colors.white,
                              buttonText: LoginTextConstant.login,
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  _authenticationBloc.add(
                                    AuthenticationLogin(
                                      userLoginModels: UserLoginModels(
                                          email:
                                              _textControllerEmail.value.text,
                                          password: _textControllerPassword
                                              .value.text),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
