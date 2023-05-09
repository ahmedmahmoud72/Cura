abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates {}

class AppLoginLoadingState extends AppLoginStates {}

class AppLoginSuccessState extends AppLoginStates {}

class AppLoginErrorState extends AppLoginStates {
  final String error;

  AppLoginErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends AppLoginStates {}
