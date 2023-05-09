import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  return Container(
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
          leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(image),),
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
  );
}
}
