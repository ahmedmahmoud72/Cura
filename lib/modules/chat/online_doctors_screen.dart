import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/layout/App_layout.dart';
import 'package:virtual_hospital_ward_app/models/online_doctors_model.dart';

import '../../shared/components/chat_component.dart';
import '../../shared/components/general_components.dart';
import '../../shared/custom_icons/my_flutter_app_icons.dart';
import '../notifications/notifications_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        title: Transform(
          transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, const AppLayout());
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              (Image.asset(
                'assets/images/cura_small_logo.png',
                height: 120,
                fit: BoxFit.cover,
              ))
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, NotificationsScreen());
            },
            icon: const Icon(MyFlutterApp.notification_icon),
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              navigateTo(context, Container());
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/images/patient.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Text(
              'Online Doctors',
              textAlign: TextAlign.start,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: dummyOnlineDoctors
                    .map((e) => ChatComponent(
                          title: e.title,
                          subTitle: e.subTitle,
                          image: e.image,
                          date: e.date,
                        ))
                    .toList()),
          ),
        ]),
      ),
    );
  }
}
