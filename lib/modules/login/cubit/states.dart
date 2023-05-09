import 'package:virtual_hospital_ward_app/models/login_model.dart';

abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates {}

class AppLoginLoadingState extends AppLoginStates {}

class AppLoginSuccessState extends AppLoginStates {
  LoginModel loginModel;

  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends AppLoginStates {
  final String error;

  AppLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends AppLoginStates {}
