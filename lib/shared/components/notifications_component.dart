import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationComponent extends StatelessWidget {
  String title;
  String subTitle;
  Function? function;

  NotificationComponent({
    required this.title,
    required this.subTitle,
    this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              subtitle: Text(
                subTitle,
                style: GoogleFonts.notoSans(),
              ),
            ),
          )),
    );
  }
}
