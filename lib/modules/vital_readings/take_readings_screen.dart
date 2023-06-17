import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/components/custom_app_bar.dart';
import '../../shared/components/general_components.dart';
import '../../shared/components/widgets/main_button.dart';

class ReadingsScreen extends StatelessWidget {
  const ReadingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'We are one step away from starting the examination process. Try to sit in a quiet and comfortable place for a better result',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              MainButton(
                text: 'Start Take Readings !',
                onTap: () {
                  navigateTo(context, Container());
                },
              ),
              Image.asset(
                'assets/images/take_readings_woman.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
