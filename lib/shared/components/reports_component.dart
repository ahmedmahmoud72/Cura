import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/models/reports_model.dart';

class ReportComponent extends StatelessWidget {
  String image;
  Function? function;
  DataModel model;

  ReportComponent({
    required this.image,
    this.function,
    required this.model,
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
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: Image.asset(image, fit: BoxFit.cover, height: 30),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    model.content!,
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(
                  model.creationDate!,
                  style: GoogleFonts.notoSans(),
                ),
                trailing: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
