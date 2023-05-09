import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:virtual_hospital_ward_app/modules/login/login_screen.dart';
import 'package:virtual_hospital_ward_app/shared/bloc_observer.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';

import 'network/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cura App',
      theme: ThemeData(
        primarySwatch: AppColors.mainColor,
      ),
      home: LoginScreen(),
    );
  }
}
