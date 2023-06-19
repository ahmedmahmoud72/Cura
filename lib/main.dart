import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_hospital_ward_app/layout/cubit/cubit.dart';
import 'package:virtual_hospital_ward_app/modules/login/login_screen.dart';
import 'package:virtual_hospital_ward_app/network/local/cache_helper.dart';
import 'package:virtual_hospital_ward_app/shared/bloc_observer.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';
import 'network/remote/firebase_options.dart';
import 'layout/App_layout.dart';
import 'network/remote/dio_helper.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getNotifications()
        ..getPrescriptions()
        ..getReports()
        ..getHealthRateReadings(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cura App',
        theme: ThemeData(
          primarySwatch: AppColors.mainColor,
        ),
        home: CacheHelper.getData(key: 'token') != null
            ? const AppLayout()
            : LoginScreen(),
      ),
    );
  }
}
