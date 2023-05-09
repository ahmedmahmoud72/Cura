import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constans.dart';

class QuizComponent extends StatelessWidget {
  Color? color ;
  String content;
  bool isSelected;

  QuizComponent({
    Key? key,
    required this.content,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          isSelected?
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ):const BoxShadow(
            color: Colors.white, // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: ListTile(
            leading: Text(
              content,
              style: GoogleFonts.notoSans(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
