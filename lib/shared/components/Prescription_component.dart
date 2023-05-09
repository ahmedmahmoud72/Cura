import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrescriptionComponent extends StatelessWidget {
  String drName;
  String specialization;
  String date;
  Function? function;

  PrescriptionComponent({
    required this.drName,
    required this.specialization,
    required this.date,
    this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  drName,
                  style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    specialization,
                    style: GoogleFonts.notoSans(),
                  ),
                  const SizedBox(height: 10),
                  Row(children: [
                    Text(
                      date,
                      style: GoogleFonts.notoSans(),
                    ),
                    const Spacer(),
                    Text(
                      textAlign: TextAlign.end,
                      'Prescription',
                      style: GoogleFonts.notoSans(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ],
              )),
        ));
  }
}
