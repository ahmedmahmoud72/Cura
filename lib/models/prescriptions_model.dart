class PrescriptionModel {
  PrescriptionDataModel? data;
  int? pageIndex;

  PrescriptionModel.fromJson(Map<String, dynamic> json) {
    pageIndex = json['pageIndex'];
    data = PrescriptionDataModel.fromJson(json['data']);
  }
}

class PrescriptionDataModel {
  List<DataModel> data = [];

  PrescriptionDataModel.fromJson(List<dynamic> json) {
    for (var element in json) {
      data.add(DataModel.fromJson(element));
    }
  }
}

class DataModel {
  int? id;
  String? content;
  String? creationDate;
  String? doctorName;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    creationDate = json['creationDate'];
    doctorName = json['doctorName'];
  }
}

class PrescriptionDummyModel {
  final String drName;
  final String specialization;
  final String date;
  final String time;

  PrescriptionDummyModel({
    required this.drName,
    required this.specialization,
    required this.date,
    required this.time,
  });
}

List<PrescriptionDummyModel> dummyPrescription = [
  PrescriptionDummyModel(
    drName: 'Dr.Anter Abdalhafez',
    date: '25 OCT',
    time: '10:57 PM',
    specialization: 'Diabetes specialist',
  ),
  PrescriptionDummyModel(
    drName: 'Dr.Anter Abdalhafez',
    date: '25 OCT',
    time: '10:57 PM',
    specialization: 'Diabetes specialist',
  ),
  PrescriptionDummyModel(
    drName: 'Dr.Anter Abdalhafez',
    date: '25 OCT',
    time: '10:57 PM',
    specialization: 'Diabetes specialist',
  ),
  PrescriptionDummyModel(
    drName: 'Dr.Anter Abdalhafez',
    date: '25 OCT',
    time: '10:57 PM',
    specialization: 'Diabetes specialist',
  ),
  PrescriptionDummyModel(
    drName: 'Dr.Anter Abdalhafez',
    date: '25 OCT',
    time: '10:57 PM',
    specialization: 'Diabetes specialist',
  ),
  PrescriptionDummyModel(
    drName: 'Dr.Anter Abdalhafez',
    date: '25 OCT',
    time: '10:57 PM',
    specialization: 'Diabetes specialist',
  ),
];
