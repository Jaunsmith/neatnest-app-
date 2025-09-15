import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../../utilities/constant/colors.dart';
import '../../../widget/app_text.dart';

class BookingTextField extends StatefulWidget {
  const BookingTextField({
    super.key,
    required this.titleText,
    required this.textEditingController,
    required this.hintText,
    this.isIcon = false,
    this.iconName,
  });

  final String titleText;
  final TextEditingController textEditingController;
  final String hintText;
  final bool isIcon;
  final IconData? iconName;

  @override
  State<BookingTextField> createState() => _BookingTextFieldState();
}

class _BookingTextFieldState extends State<BookingTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        primaryText(text: widget.titleText, fontSize: 14.sp),
        5.ht,
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.textFieldBckColor.withValues(alpha: 0.35),
          ),
          child: TextField(
            controller: widget.textEditingController,
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: AppColors.secondaryTextColor),
              suffixIcon: !widget.isIcon
                  ? null
                  : GestureDetector(child: Icon(widget.iconName)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.containerLightBackground,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.containerLightBackground,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
