import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/layout/cubit/cubit.dart';
import 'package:virtual_hospital_ward_app/models/health_rate_model.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';
import '../../shared/components/custom_app_bar.dart';
import '../../shared/components/readings_component.dart';

class HealthRateScreen extends StatelessWidget {
  const HealthRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HealthRateModel? healthRateModel = AppCubit.get(context).healthRateModel;
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/doctor.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black54,
                  height: 250,
                  width: double.infinity,
                  child: SizedBox(
                    width: 100,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Patience is the best\nmedicine',
                          style: GoogleFonts.ubuntu(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20,
                right: 20,
              ),
              child: Text(
                'Your Readings',
                textAlign: TextAlign.start,
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1 / 1.55,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: [
                    ReadingsComponent(
                      rate: healthRateModel!.heartRate,
                      image: 'assets/images/readings/heart rate.png',
                      readingName: 'Heart Rate',
                      color: Colors.blueAccent,
                    ),
                    ReadingsComponent(
                      rate: healthRateModel.skinTemperature,
                      image: 'assets/images/readings/Skin Temperature.png',
                      readingName: 'Skin Temperature',
                      color: AppColors.mainColor,
                    ),
                    ReadingsComponent(
                      rate: healthRateModel.respirationRate,
                      image: 'assets/images/readings/Respiration Rate.png',
                      readingName: 'Respiration Rate',
                      color: AppColors.mainColor,
                    ),
                    ReadingsComponent(
                      rate:
                      healthRateModel.bloodPressure,
                      image: 'assets/images/readings/blood pressure.png',
                      readingName: 'Blood Pressure',
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
