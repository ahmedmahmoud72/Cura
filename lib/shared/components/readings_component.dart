import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constans.dart';

class ReadingsComponent extends StatelessWidget {
  String rate;
  String image;
  String readingName;
  Color color;

  ReadingsComponent({
    required this.rate,
    required this.image,
    required this.readingName,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(rate, style: GoogleFonts.notoSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                )),
              ),
            ),
            const SizedBox(height: 20,),
            Image.asset(image,height: 100,fit: BoxFit.cover,),
            const SizedBox(height: 30,),
            Text(readingName, style: GoogleFonts.notoSans( fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
          ],
        ));
  }
}
