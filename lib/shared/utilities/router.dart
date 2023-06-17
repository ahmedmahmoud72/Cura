import 'package:flutter/cupertino.dart';
import 'package:virtual_hospital_ward_app/layout/App_layout.dart';
import 'package:virtual_hospital_ward_app/modules/login/login_screen.dart';
import 'package:virtual_hospital_ward_app/shared/utilities/routes.dart';


Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
          builder: (_) =>  LoginScreen(),
          settings: settings);
    case AppRoutes.appLayoutRoute:
      return CupertinoPageRoute(
          builder: (_) => const AppLayout(), settings: settings);
    default:
      return CupertinoPageRoute(
          builder: (_) => LoginScreen(), settings: settings);
  }
}
