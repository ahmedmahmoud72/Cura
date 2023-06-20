import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_hospital_ward_app/layout/App_layout.dart';
import 'package:virtual_hospital_ward_app/modules/login/cubit/cubit.dart';
import 'package:virtual_hospital_ward_app/modules/login/cubit/states.dart';
import 'package:virtual_hospital_ward_app/shared/components/widgets/main_button.dart';
import 'package:virtual_hospital_ward_app/shared/components/widgets/my_toast.dart';
import '../../network/local/cache_helper.dart';
import '../../shared/components/general_components.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppLoginCubit(),
        child: BlocConsumer<AppLoginCubit, AppLoginStates>(
          listener: (context, state) {
            try {
              if (state is AppLoginSuccessState) {
                DisplayMotionToast(
                  state: ResponseState.success,
                  message: "Login Successfully",
                  context: context,
                ).displayMotionToast(ResponseState.success);

                final token = state.loginModel.token;
                CacheHelper.saveData(
                  key: 'token',
                  value: token,
                ).then((value) {
                  navigateToAndKill(context, const AppLayout());
                  print(CacheHelper.getData(key: 'token'));
                });
              } else if (state is AppLoginErrorState) {
                DisplayMotionToast(
                  state: ResponseState.error,
                  message: "Incorrect Password",
                  context: context,
                ).displayMotionToast(ResponseState.error);
              }
            } catch (error) {
              debugPrint(error.toString());
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsetsDirectional.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Login',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              height: 20.0,
                            ),
                            DefaultTFF(
                              labelText: 'Email',
                              prefixIcon: Icons.mail_outline,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: _emailFocusNode,
                              controller: emailController,
                              onFieldSubmitted: (value) {},
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return ('Email Address is required');
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            DefaultTFF(
                              obscureText:
                                  AppLoginCubit.get(context).isPassword,
                              labelText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              focusNode: _passwordFocusNode,
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  AppLoginCubit.get(context).patientLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              prefixIcon: Icons.lock_outline,
                              suffixIcon: AppLoginCubit.get(context).suffix,
                              suffixPressed: () {
                                AppLoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return ('Password Address is required');
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ConditionalBuilder(
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                                condition: state is! AppLoginLoadingState,
                                builder: (context) => MainButton(
                                  weight: double.infinity,
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          AppLoginCubit.get(context)
                                              .patientLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      },
                                      text: 'Login',
                                    )),
                          ]),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
