import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/shared/constants.dart';
import '../../shared/components/custom_app_bar.dart';
import '../../shared/components/general_advice_component.dart';

class GeneralAdviceScreen extends StatelessWidget {
  GeneralAdviceScreen({Key? key}) : super(key: key);

  Color myColor = AppColors.mainColor;

  var imageList = [
    'https://dev.rodpub.com/images/142/631_main.jpg',
    'https://www.verywellhealth.com/thmb/mDDiRnxspUTh5L3X3mWTajMdPDQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/systolic-and-diastolic-blood-pressure-1746075-01-4f002165f49646d08ca287995c2af55e.png',
    'https://domf5oio6qrcr.cloudfront.net/medialibrary/7400/bb5509e2-61d9-4346-b64f-8cb6ab5f3fa4.jpg',
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
                items: imageList.map(
                      (e) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: e,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ],
                    ),
                  ),
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                'Advice Details',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
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
                padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
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
