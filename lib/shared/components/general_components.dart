import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateToAndKill(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

class DefaultTFF extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  VoidCallback? suffixPressed;
  final Function validator;
  final Function? onFieldSubmitted;
  final Function? onChanged;
  bool obscureText;
  final double? radius;
  FocusNode? focusNode;
  final double? width;

  DefaultTFF(
      {Key? key,
      required this.labelText,
      required this.keyboardType,
      required this.controller,
      required this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      this.onFieldSubmitted,
      this.onChanged,
      this.suffixPressed,
      required this.obscureText,
      this.radius,
      this.width,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 20),
              ),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIcon),
              ),
              labelText: labelText),
          validator: (value) {
            return validator(value);
          },
          onFieldSubmitted: (value) {
            onFieldSubmitted!(value);
          }),
    );
  }
}
