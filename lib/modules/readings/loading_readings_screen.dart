import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_hospital_ward_app/modules/readings/results_screen.dart';
import 'package:virtual_hospital_ward_app/shared/components/widgets/main_button.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';

import '../../shared/components/general_components.dart';


class ReadingsLoadingScreen extends StatefulWidget {
  const ReadingsLoadingScreen({Key? key}) : super(key: key);

  @override
  _ReadingsLoadingScreenState createState() => _ReadingsLoadingScreenState();
}

class _ReadingsLoadingScreenState extends State<ReadingsLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Collecting Data...',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSans(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Please wait a few moments to complete the examination',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSans(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              CircularPercentIndicator(
                animation: true,
                animationDuration: 7000,
                radius: 100,
                lineWidth: 20,
                percent: 1,
                progressColor: AppColors.myGreen,
                backgroundColor: Colors.grey,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              const SizedBox(height: 50),
              MainButton(text: 'Show Results', onTap: (){
                navigateTo(context, const ResultsScreen());
              },color: AppColors.myGreen,)
            ],
          ),
        ),
      ),
    );
  }
}
