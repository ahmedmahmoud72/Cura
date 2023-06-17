class HealthRateModel {
  late String heartRate;
  late String skinTemperature;
  late String respirationRate;
  late String bloodPressure;

  HealthRateModel.fromJson(Map<String, dynamic> json) {
    heartRate = json['heartRate'];
    skinTemperature = json['skinTemperature'];
    respirationRate = json['respirationRate'];
    bloodPressure = json['bloodPressure'];
  }
}

Map<String, dynamic> dummyHealthRateReadings = {
  'heartRate': '72 bpm',
  'skinTemperature': '36.5°C',
  'respirationRate': '60 beats',
  'bloodPressure': '141/90 mmHg',
};