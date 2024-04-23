import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends GetView {
  final String text;
  final Color color, textColor;
  final VoidCallback onPressed;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.color,
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(29.0)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
