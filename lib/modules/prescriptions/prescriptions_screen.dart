import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/models/prescriptions_model.dart';

import '../../shared/components/Prescription_component.dart';
import '../../shared/components/custom_app_bar.dart';

class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prescriptions',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: dummyPrescription
                    .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: PrescriptionComponent(
                          drName: e.drName,
                          specialization: e.specialization,
                          date: '${e.date} at ${e.time}',
                        )))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
