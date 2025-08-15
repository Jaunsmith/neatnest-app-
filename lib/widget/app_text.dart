import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget primaryText({
  required String text,
  double? fontSize,
  TextAlign textAlign = TextAlign.start,
  Color color = const Color(0xFF090909),
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize ?? 20.sp,
    ),
  );
}

Widget secondaryText({
  required String text,
  double? fontSize,
  TextAlign textAlign = TextAlign.start,
  Color color = const Color(0xFF999A9B),
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: fontSize ?? 14.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}
