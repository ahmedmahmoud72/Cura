import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_hospital_ward_app/modules/login/cubit/states.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';
import '../../../network/remote/dio_helper.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);

  void patientLogin({
    required String email,
    required String password,
  }) {
    emit(AppLoginLoadingState());
    DioHelper.postData(
      url: AppEndPoints.login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      debugPrint(value.toString());
      emit(AppLoginSuccessState());
    }).catchError((error) {
      emit(AppLoginErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword =! isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());

  }
}
