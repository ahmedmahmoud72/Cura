import 'package:flutter/material.dart';
import 'package:virtual_hospital_ward_app/network/local/cache_helper.dart';

class AppEndPoints {
  static String baseURL = 'http://www.cur.somee.com';
  static const login = '/api/Account/login';
  static const notification = '/Api/Notification';
  static const prescription = '/api/Prescription/prescription/2';
  static const reports = '/api/Report/GetAllReports';
}




















String token = CacheHelper.getData(key: 'token');

class AppColors {
  static MaterialColor mainColor = const MaterialColor(0xff262B63, <int, Color>{
    50: Color(0xffE8EAF6),
    100: Color(0xffC5CAE9),
    200: Color(0xff9FA8DA),
    300: Color(0xff7986CB),
    400: Color(0xff5C6BC0),
    500: Color(0xff3F51B5),
    600: Color(0xff3949AB),
    700: Color(0xff303F9F),
    800: Color(0xff283593),
    900: Color(0xff1A237E),
  });
  static Color myGreen = const Color(0xff00E4DF);
  static Color myLightGreen = const Color(0xff3FFF97);
  static Color myBlue = const Color(0xff0085D0);
  static Color myBabyBlue = const Color(0xffD6F4F6);
  static Color myLightBlue = const Color(0xff44A6F2);
  static Color myDeepOrange = const Color(0xffEF9105);
  static Color myBrown = const Color(0xffCFB4A9);
  static Color myRed = const Color(0xffF55557);
}

class AppImages {
  static String curaLogo = 'assets/images/cura_small_logo.png';
  static String patient = 'assets/images/patient.png';

  static String emotion1 = 'assets/images/emotions/emotion1.png';
  static String emotion2 = 'assets/images/emotions/emotion2.png';
  static String emotion3 = 'assets/images/emotions/emotion3.png';
  static String emotion4 = 'assets/images/emotions/emotion4.png';
  static String emotion5 = 'assets/images/emotions/emotion5.png';
  static String emotion6 = 'assets/images/emotions/emotion6.png';
}
