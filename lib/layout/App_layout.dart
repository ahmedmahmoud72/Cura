import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/layout/cubit/cubit.dart';
import 'package:virtual_hospital_ward_app/layout/cubit/states.dart';
import 'package:virtual_hospital_ward_app/modules/reports/reports_screen.dart';
import '../modules/Prescriptions/prescriptions_screen.dart';
import '../modules/chat/online_doctors_screen.dart';
import '../modules/general_advice/general_advice.dart';
import '../modules/notifications/notifications_screen.dart';
import '../modules/readings/reading_screen.dart';
import '../modules/vital_readings/health_rate_screen.dart';
import '../shared/components/general_components.dart';
import '../shared/components/home_component.dart';
import '../shared/constants.dart';
import '../shared/custom_icons/my_flutter_app_icons.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Image.asset(
                AppImages.curaLogo,
                height: size.height * 0.15,
                fit: BoxFit.cover,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, const ChatScreen());
                    },
                    icon: const Icon(
                      MyFlutterApp.comment_empty,
                      color: Colors.black,
                    )),
                IconButton(
                  onPressed: () {
                    navigateTo(context, NotificationsScreen());
                  },
                  icon: const Icon(MyFlutterApp.notification_icon),
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(context, Container());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage(AppImages.patient),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vital Signs Checks',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          HomeComponent(
                            title: 'How are you feeling today?',
                            subTitle:
                                'How is heart disease making you feel today?',
                            image: AppImages.emotion1,
                            color: AppColors.myGreen,
                            function: () {
                              navigateTo(context, Container());
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          HomeComponent(
                            title: 'Your health rate',
                            subTitle:
                                'Find out the rate of stability of your health recently',
                            image: AppImages.emotion2,
                            color: AppColors.myLightGreen,
                            function: () {
                              navigateTo(context, const HealthRateScreen());
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'Advice and Reports',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          HomeComponent(
                            title: 'Reports',
                            subTitle:
                                'Explore your new health reports to check on your health',
                            image: AppImages.emotion3,
                            color: AppColors.myDeepOrange,
                            function: () {
                              navigateTo(context, const ReportsScreen());
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          HomeComponent(
                            title: 'Prescriptions',
                            subTitle:
                                'Explore your new health reports to check on your health',
                            image: AppImages.emotion4,
                            color: AppColors.myBabyBlue,
                            function: () {
                              navigateTo(context, const PrescriptionsScreen());
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          HomeComponent(
                            title: 'General Advice',
                            subTitle:
                                'Help and Advice will help stabilize your health. Make sure to read it daily',
                            image: AppImages.emotion5,
                            color: AppColors.myBrown,
                            function: () {
                              navigateTo(context, GeneralAdviceScreen());
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'Support',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          HomeComponent(
                            title: 'Help & Support',
                            subTitle:
                                'Please contact us if you have a problem or inquire about something',
                            image: AppImages.emotion6,
                            color: AppColors.myLightBlue,
                            function: () {
                              navigateTo(context, Container());
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            floatingActionButton: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: AppColors.myRed,
                  onPressed: () {
                    navigateTo(context, Container());
                  },
                  child: const Icon(FontAwesome5.ambulance),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: AppColors.myRed,
                  onPressed: () {
                    navigateTo(context, const ReadingsScreen());
                  },
                  child: const Icon(FontAwesome5.hand_holding_medical),
                ),
              ],
            ));
      },
    );
  }
}
