import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:virtual_hospital_ward_app/modules/readings/reading_screen.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';

import '../../shared/components/general_components.dart';
import 'loading_readings_screen.dart';


class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.body, required this.title});
}

class ReadingInstructionScreen extends StatefulWidget {
  const ReadingInstructionScreen({Key? key}) : super(key: key);

  @override
  State<ReadingInstructionScreen> createState() => _ReadingInstructionScreenState();
}

class _ReadingInstructionScreenState extends State<ReadingInstructionScreen> {
  List<BoardingModel> boardingList = [
    BoardingModel(
        image: 'assets/images/readings_info1.png',
        title: 'Relax, set down and take a deep breath',
        body: 'Stay away from the effects of noise and try to remain in a calm and appropriate position'),
    BoardingModel(
        image: 'assets/images/readings_info2.png',
        title: 'Position Your blood pressure monitor',
        body: 'Stay away from the effects of noise and try to remain in a calm and appropriate position'),
  ];

  PageController boardController = PageController();

  bool isLast = false;
  void submit () {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              navigateTo(context, const ReadingsScreen());
            },
             icon:const Icon(Icons.arrow_back_ios),
          ),
          elevation: 0,
          backgroundColor: AppColors.mainColor,
          actions: [
            TextButton(
                onPressed: (){
                  navigateTo(context, const ReadingsLoadingScreen());
                },
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white),

                )),
          ],
        ),
        body: Container(
            color: AppColors.mainColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (int index)
                      {
                        if (index == boardingList.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                      controller: boardController,
                      itemBuilder: (context, index) =>
                          buildBoardingItem(boardingList[index]),
                      physics: const BouncingScrollPhysics(),
                      itemCount: boardingList.length,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: boardingList.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.white,
                        spacing: 5.0,
                        dotWidth: 20.0,
                        dotHeight: 15.0,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.white,

                        onPressed: () {
                          if (isLast) {
                            submit();
                            navigateTo(context, const ReadingsLoadingScreen());
                          }
                          boardController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child:  Icon(Icons.arrow_forward_ios_outlined,color: AppColors.mainColor,size: 25,)),
                  ]),
                ],
              ),
            ),
          ),
        ),
      );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.title,
            textAlign:TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            model.body,
            textAlign:TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 15.0,
                color: Colors.white
            ),
          ),
          const SizedBox(
            height: 70.0,
          ),
          Image(
            image: AssetImage(model.image),
            height: 351,
            fit: BoxFit.cover,
          ),


        ],
      );
}
