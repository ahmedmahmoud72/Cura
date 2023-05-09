import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeComponent extends StatelessWidget {
  String title;
  String subTitle;
  String image;
  Color color;
  Function? function;

  HomeComponent({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.color,
    this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              title,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          subtitle: Text(subTitle, style: GoogleFonts.notoSans(),),
          trailing: Image.asset(image),
          onTap: () {
            function!();
          },
        ),
      ),
    );
  }
}
