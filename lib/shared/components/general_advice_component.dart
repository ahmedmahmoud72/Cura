import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAdvice extends StatelessWidget {
  double height, width;
  String eventName, description, text, imageUrl;
  Color? color;
  Function function;

  CustomAdvice(
      {Key? key,
      required this.eventName,
      required this.description,
      required this.height,
      required this.width,
      required this.text,
      required this.imageUrl,
      this.color,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          imageUrl,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white54,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 7,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: width,
          child: ExpansionTile(
            backgroundColor: Colors.white,
            title: Text(
              eventName,
              style: GoogleFonts.notoSans(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                  title: Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: GoogleFonts.content(fontSize: 16),
              )),
              ListTile(
                  title:  customButton(
                    function: () {},
                    text: 'See More',
                    height: 30,
                    color: const Color(0xff262B63)),
              )
            ],
          ),
        )
      ],
    );
  }
}

Widget customButton(
        {double? width,
        double? height,
        Color? color,
        required Function function,
        required String text}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
      ),
      height: height,
      width: width,
      child: MaterialButton(
        minWidth: width,
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: GoogleFonts.notoSans(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
