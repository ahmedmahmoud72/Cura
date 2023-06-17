class ReportsModel {
  ReportsDataModel? data;
  int? pageIndex;

  ReportsModel.fromJson(Map<String, dynamic> json) {
    pageIndex = json['pageIndex'];
    data = ReportsDataModel.fromJson(json['data']);
  }
}

class ReportsDataModel {
  List<DataModel> data = [];

  ReportsDataModel.fromJson(List<dynamic> json) {
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
