import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class TextFiledHolder extends StatelessWidget {
  const TextFiledHolder({
    super.key,
    required this.titleText,
    this.hintText,
    this.textAlign,
    this.textStyle,
    this.controller,
    this.containerHeight,
  });

  final String titleText;
  final String? hintText;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final double? containerHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        primaryText(text: titleText, fontSize: 12.sp),
        10.ht,
        Container(
          height: containerHeight ?? 100.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.containerLightBackground,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: TextField(
            expands: true,
            autofocus: false,
            showCursor: true,
            controller: controller,
            style:
                textStyle ??
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            textAlign: textAlign ?? TextAlign.center,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText ?? '',
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
