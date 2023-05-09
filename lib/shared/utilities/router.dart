import 'package:flutter/cupertino.dart';
import 'package:virtual_hospital_ward_app/modules/login/login_screen.dart';
import 'package:virtual_hospital_ward_app/shared/utilities/routes.dart';


Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
          builder: (_) =>  LoginScreen(),
          settings: settings);
    // case AppRoutes.homePageRoute:
    //   return CupertinoPageRoute(
    //       builder: (_) => const MainPage(), settings: settings);
    // case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
          builder: (_) => LoginScreen(), settings: settings);
  }
}
