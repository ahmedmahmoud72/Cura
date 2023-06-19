import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  Color? color;
  double height;
  double weight;

  MainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.height = 200.0,
    this.weight = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: height,
        height: weight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
            ),
            onPressed: onTap,
            child: Text(
              text,
            ),
          ),
        ));
  }
}
