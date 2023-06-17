import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/layout/cubit/cubit.dart';
import 'package:virtual_hospital_ward_app/models/reports_model.dart';

import '../../shared/components/custom_app_bar.dart';
import '../../shared/components/reports_component.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportsModel? reportsModel = AppCubit.get(context).reportsModel;

    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reports',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reportsModel!.data!.data.length,
                itemBuilder: (context, index) => ReportComponent(
                  image: 'assets/images/report.png',
                  model: reportsModel.data!.data[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
