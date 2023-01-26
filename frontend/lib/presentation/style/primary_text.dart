import 'package:flutter/material.dart';

import 'app_colors.dart';

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;

  // ignore: use_key_in_widget_constructors
  const PrimaryText({
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.lightGray,
    this.size = 20,
    this.height = 1.3,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        height: height,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
