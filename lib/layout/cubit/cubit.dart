import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_hospital_ward_app/layout/cubit/states.dart';
import 'package:virtual_hospital_ward_app/models/health_rate_model.dart';
import 'package:virtual_hospital_ward_app/models/reports_model.dart';
import 'package:virtual_hospital_ward_app/network/remote/dio_helper.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';

import '../../models/prescriptions_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  String authorization = 'Bearer $token';

  void getNotifications() {
    emit(AppNotificationLoadingState());
    DioHelper.getData(url: AppEndPoints.notification, token: authorization)
        .then((value) {
      emit(AppNotificationSuccessState());
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(AppNotificationErrorState());
    });
  }

  PrescriptionModel? prescriptionModel;

  void getPrescriptions() {
    emit(AppPrescriptionLoadingState());
    DioHelper.getData(url: AppEndPoints.prescription, token: authorization)
        .then((value) {
      prescriptionModel = PrescriptionModel.fromJson(value.data);
      emit(AppPrescriptionsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppPrescriptionsErrorState());
    });
  }

  ReportsModel? reportsModel;

  void getReports() {
    emit(AppReportsLoadingState());
    DioHelper.getData(
      url: AppEndPoints.reports,
      token: authorization,
    ).then((value) {
      reportsModel = ReportsModel.fromJson(value.data);
      emit(AppReportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppReportsErrorState());
    });
  }

  HealthRateModel? healthRateModel;

  void getHealthRateReadings() {
    emit(AppReportsLoadingState());
    if (dummyHealthRateReadings.isNotEmpty) {
      healthRateModel = HealthRateModel.fromJson(dummyHealthRateReadings);
      emit(GetHealthRateReadingsSuccessState(healthRateModel!));
    } else {
      emit(GetHealthRateReadingsErrorState());
    }
  }
}
