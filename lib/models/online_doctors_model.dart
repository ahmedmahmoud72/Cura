import 'package:intl/intl.dart';

class OnlineDoctorsModel {
  late String title;
  late String subTitle;
  late String date;
  late String image;

  OnlineDoctorsModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.image,
  });
}

List<OnlineDoctorsModel> dummyOnlineDoctors = [
  OnlineDoctorsModel(
    date: DateFormat('hh:mm a').format(DateTime.now().add(const Duration(hours: 1))),
    title: 'Ahmed Mahmoud',
    subTitle: 'How can I help you',
    image: 'assets/images/doctor.jpg',
  ),
];
