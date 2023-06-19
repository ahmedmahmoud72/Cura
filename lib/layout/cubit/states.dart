import 'package:virtual_hospital_ward_app/models/health_rate_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppNotificationLoadingState extends AppStates {}
class AppNotificationSuccessState extends AppStates {}
class AppNotificationErrorState extends AppStates {}

class AppPrescriptionLoadingState extends AppStates {}
class AppPrescriptionsSuccessState extends AppStates {}
class AppPrescriptionsErrorState extends AppStates {}

class AppReportsLoadingState extends AppStates {}
class AppReportsSuccessState extends AppStates {
  AppReportsSuccessState();
}
class AppReportsErrorState extends AppStates {}


class GetHealthRateReadingsLoadingState extends AppStates {}
class GetHealthRateReadingsSuccessState extends AppStates {
  final HealthRateModel healthRateModel;

  GetHealthRateReadingsSuccessState(this.healthRateModel);
}
class GetHealthRateReadingsErrorState extends AppStates {}

class GetOnlineDoctorLoadingState extends AppStates {}
class GetOnlineDoctorSuccessState extends AppStates {

}
class GetOnlineDoctorErrorState extends AppStates {}