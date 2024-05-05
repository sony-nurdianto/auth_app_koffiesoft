import 'package:auth_app_koffiesoft/aplication/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:auth_app_koffiesoft/aplication/repository/authentication/auth_repository_impl.dart';
import 'package:auth_app_koffiesoft/aplication/usecase/authentication/login_usecase_impl.dart';
import 'package:auth_app_koffiesoft/constant/formText/form_text_constant.dart';
import 'package:auth_app_koffiesoft/constant/path/assets_path_constatant.dart';
import 'package:auth_app_koffiesoft/constant/routes_path_constant.dart';
import 'package:auth_app_koffiesoft/constant/screens/login_text.dart';
import 'package:auth_app_koffiesoft/constant/screens/register_text.dart';
import 'package:auth_app_koffiesoft/constant/widget/dialog_constant.dart';
import 'package:auth_app_koffiesoft/domain/models/users/user_register_models.dart';
import 'package:auth_app_koffiesoft/presentation/widgets/custom_dialog_info.dart';
import 'package:auth_app_koffiesoft/presentation/widgets/custom_elevated_button.dart';
import 'package:auth_app_koffiesoft/presentation/widgets/custom_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  late AuthenticationBloc _authenticationBloc;

  //userNameProperties
  final TextEditingController _textControllerEmail = TextEditingController();
  final FocusNode _focusNodeEmail = FocusNode();

  //passwordProperties
  final TextEditingController _textControllerPassword = TextEditingController();
  final FocusNode _focusNodePassword = FocusNode();

  //PhoneNumberProperties
  final TextEditingController _textControllerPhoneNum = TextEditingController();
  final FocusNode _focusNodePhoneNum = FocusNode();

  //FirstNameProperties
  final TextEditingController _textControllerFName = TextEditingController();
  final FocusNode _focusNodeFName = FocusNode();

  final TextEditingController _textControllerLName = TextEditingController();
  final FocusNode _focusNodeLName = FocusNode();

  List<Map<String, dynamic>> list = [
    {'gender': 'Male', 'value': 1},
    {'gender': 'Female', 'value': 2}
  ];

  int? selectedValue;
  bool isPasswordVisible = false;

  @override
  void initState() {
    _authenticationBloc =
        AuthenticationBloc(AuthenticationUsecaseImpl(AuthRepositoryImpl()));
    super.initState();
  }

  @override
  void dispose() {
    _textControllerEmail.dispose();
    _focusNodeEmail.dispose();
    _textControllerPassword.dispose();
    _focusNodePassword.dispose();
    _textControllerPhoneNum.dispose();
    _focusNodePhoneNum.dispose();
    _textControllerFName.dispose();
    _focusNodeFName.dispose();
    _textControllerLName.dispose();
    _focusNodeLName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => _authenticationBloc,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
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
                    dialgoText: DialogConstant.successRegister,
                    icon: Icons.check,
                    backgroundColor: Colors.white,
                    iconColor: Colors.green);
                Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.pop(context);
                  setState(() {
                    context.go(RoutePathConstant.loginRoutePath);
                  });
                });
              }
              if (state is AuthenticationFailure) {
                customShowDialogInfo(context,
                    dialgoText: DialogConstant.successRegister,
                    icon: Icons.close,
                    backgroundColor: Colors.white);
                Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              }
            },
            builder: (context, state) {
              return DecoratedBox(
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
                            Container(
                              constraints: const BoxConstraints(
                                  minWidth: 300, maxWidth: 500),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      LoginTextConstant.register,
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    controller: _textControllerFName,
                                    focusNode: _focusNodeFName,
                                    borderRadius: 30.0,
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icons.person,
                                    hintText: '${FormTextConstant.hintTextFirstName}*',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '${FormTextConstant.hintTextFirstName} ${FormTextConstant.validateFieldEmpty}*';
                                      }
                                      if (value.length <= 3) {
                                        return '${FormTextConstant.validateMinimumLength} ${FormTextConstant.hintTextFirstName} 3';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    controller: _textControllerLName,
                                    focusNode: _focusNodeLName,
                                    borderRadius: 30.0,
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icons.person_2_outlined,
                                    hintText: '${FormTextConstant.hintTextLastName}*',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '${FormTextConstant.hintTextLastName} ${FormTextConstant.validateFieldEmpty}*';
                                      }
                                      if (value.length <= 3) {
                                        return '${FormTextConstant.validateMinimumLength} ${FormTextConstant.hintTextLastName} 3';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: const Text(FormTextConstant.hintTextGender),
                                      buttonStyleData: ButtonStyleData(
                                        //  padding: const EdgeInsets.symmetric(horizontal: 20),
                                        height: 63,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        // customHeights: [40,40],
                                      ),
                                      value: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          // print(value);
                                          selectedValue = value as int?;
                                        });
                                      },
                                      items: list
                                          .map((Map<String, dynamic> item) =>
                                              DropdownMenuItem(
                                                value: item['value'],
                                                child: Text(item['gender'],
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    )),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    controller: _textControllerEmail,
                                    focusNode: _focusNodeEmail,
                                    borderRadius: 30.0,
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icons.email_outlined,
                                    hintText: '${FormTextConstant.hintTextEmail}*',
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '${FormTextConstant.hintTextEmail} ${FormTextConstant.validateFieldEmpty}';
                                      }
                                      if (!RegExp(
                                              r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*\.\w{2,3}$')
                                          .hasMatch(value)) {
                                        return '${FormTextConstant.invalidFormat} ${FormTextConstant.hintTextEmail}';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    controller: _textControllerPhoneNum,
                                    focusNode: _focusNodePhoneNum,
                                    borderRadius: 30.0,
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icons.phone_android_outlined,
                                    hintText: '${FormTextConstant.hintTextPhoneNumber}*',
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '${FormTextConstant.hintTextPhoneNumber} ${FormTextConstant.validateFieldEmpty}';
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
                                    hintText: '${FormTextConstant.hintTextPassword}*',
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '${FormTextConstant.hintTextPassword} ${FormTextConstant.validateFieldEmpty}';
                                      }

                                      if (!RegExp(r'^[a-zA-Z0-9_\$@#]{8,20}$')
                                          .hasMatch(value)) {
                                        return 'Password must be at least 8 characters long, no more than 20 characters, and may contain uppercase letters, lowercase letters, numbers, and symbols (\$, @, or #).';
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
                                      const Text(
                                        RegisterTextConstant.askingAcount,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // context.go('/');
                                          context.go(
                                              RoutePathConstant.loginRoutePath);
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
                                            LoginTextConstant.login,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 228, 142, 14),
                                                fontSize: 16),
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
                              buttonText: 'Register',
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  UserRegisterModels registerUser =
                                      UserRegisterModels(
                                    firstName: _textControllerFName.value.text,
                                    lastName: _textControllerLName.value.text,
                                    gender: selectedValue,
                                    email: _textControllerEmail.value.text,
                                    phoneNumber:
                                        _textControllerPhoneNum.value.text,
                                    password:
                                        _textControllerPassword.value.text,
                                  );
                                  _authenticationBloc.add(
                                      AuthenticationRegister(
                                          userRegisterModels: registerUser));
                                  // print(selectedValue);
                                  // print(registerUser.email);
                                  // print(registerUser.password);
                                  // print(registerUser.firstName);
                                  // print(registerUser.lastName);
                                  // print(registerUser.phoneNumber);
                                  // print(registerUser.gender);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
