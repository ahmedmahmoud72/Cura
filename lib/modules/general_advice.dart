import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';
import '../shared/components/custom_app_bar.dart';
import '../shared/components/general_advice_component.dart';

class GeneralAdviceScreen extends StatelessWidget {
  GeneralAdviceScreen({Key? key}) : super(key: key);
  Color myColor = AppColors.mainColor;
  var imageList = [
    'https://dev.rodpub.com/images/142/631_main.jpg',
    'https://www.verywellhealth.com/thmb/mDDiRnxspUTh5L3X3mWTajMdPDQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/systolic-and-diastolic-blood-pressure-1746075-01-4f002165f49646d08ca287995c2af55e.png',
    'https://timebusinessnews.com/wp-content/uploads/blood-pressure-scaled-1.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                ),
                items: imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(
                                e,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                'Advices Details',
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                child: CustomAdvice(
                  imageUrl: imageList[1],
                  eventName: 'Blood Pressure',
                  height: 300,
                  width: 380,
                  description:
                      'Blood pressure numbers of less than 120/80 mm Hg are considered within the normal range. If your results fall into this category, stick with heart-healthy habits like following a balanced diet and getting regular exercise.',
                  function: () {},
                  text: 'GO',
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
