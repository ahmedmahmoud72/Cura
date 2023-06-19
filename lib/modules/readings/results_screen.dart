import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/modules/readings/reading_screen.dart';
import 'package:virtual_hospital_ward_app/shared/components/widgets/main_button.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';

import '../../layout/App_layout.dart';
import '../../shared/components/general_components.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.mainColor,
          ),
          DraggableScrollableSheet(
              minChildSize: 0.1,
              initialChildSize: 0.10,
              builder: (context, scrollController) => SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Readings',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.abhayaLibre(
                                  textStyle: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: 'Your Readings are ',
                                  style: GoogleFonts.notoSans(
                                      textStyle: const TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Stable',
                                        style: GoogleFonts.notoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: Colors.green))),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Readings',
                                              style: GoogleFonts.notoSans(
                                                textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              '20/100',
                                              style: GoogleFonts.notoSans(
                                                textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 20),
                                  itemCount: 6),
                              const SizedBox(
                                height: 30,
                              ),
                              MainButton(
                                text: 'Done',
                                onTap: () {
                                  navigateTo(context, const AppLayout());
                                },
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border:
                                        Border.all(color: AppColors.mainColor),
                                    color: Colors.white),
                                width: 150,
                                height: 50,
                                child: MaterialButton(
                                  onPressed: () {
                                    navigateTo(context, const ReadingsScreen());
                                  },
                                  child: Text(
                                    'Try Again !',
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
