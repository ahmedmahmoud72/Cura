import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_hospital_ward_app/shared/components/general_components.dart';

import '../../modules/chat/chat_screen.dart';

class ChatComponent extends StatelessWidget {
  String title;
  String subTitle;
  String image;
  Function? function;
  String date;

  ChatComponent({
  required this.title,
  required this.subTitle,
  required this.image,
  this.function,
  required this.date,
  super.key,
});

@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            onTap: (){
              navigateTo(context, ChatPage());
            },
            leading: Stack(
                children:[ CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(image),
                ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ]),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                title,
                style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(
              subTitle,
              style: GoogleFonts.notoSans(),
            ),
            trailing: Text(date, style: GoogleFonts.notoSans(),),

          ),
        )
    ),
  );
}
}
