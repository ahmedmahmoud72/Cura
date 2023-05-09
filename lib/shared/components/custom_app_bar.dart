import 'package:flutter/material.dart';
import '../custom_icons/my_flutter_app_icons.dart';
import 'general_components.dart';

PreferredSizeWidget customAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    titleSpacing: 0.0,
    title: Transform(
      transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
               navigateTo(context, Container());
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          (
              Image.asset(
                'assets/images/cura_small_logo.png',
                height: 100,
                fit: BoxFit.cover,
              )
          )
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            navigateTo(context, Container());
          },
          icon: const Icon(
            MyFlutterApp.comment_empty,
            color: Colors.black,
          )),
      IconButton(
        onPressed: () {
          navigateTo(context, Container());
        },
        icon: const Icon(MyFlutterApp.notification_icon),
        color: Colors.black,
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
  );
}