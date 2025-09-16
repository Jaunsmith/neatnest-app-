import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class AuthTextFiled extends StatefulWidget {
  const AuthTextFiled({
    super.key,
    required this.titleText,
    required this.hintText,
    this.secure = false,
    required this.textEditingController,
    this.maxLine = 1,
    this.containerHeight,
    this.textInputType,
    this.inputFormatter,
  });

  final String titleText;
  final String hintText;
  final bool secure;
  final TextEditingController textEditingController;
  final int? maxLine;
  final double? containerHeight;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;

  @override
  State<AuthTextFiled> createState() => _AuthTextFiledState();
}

class _AuthTextFiledState extends State<AuthTextFiled> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        primaryText(text: widget.titleText, fontSize: 14.sp),
        5.ht,
        Container(
          height: widget.containerHeight?.h ?? 45.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.textFieldBckColor.withValues(alpha: 0.3),
          ),
          child: TextField(
            controller: widget.textEditingController,
            keyboardType: widget.textInputType ?? TextInputType.multiline,
            maxLines: widget.maxLine,
            inputFormatters: widget.inputFormatter,
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: AppColors.secondaryTextColor),
              suffixIcon: !widget.secure
                  ? null
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      child: Icon(
                        visible ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primaryColor,
                      ),
                    ),
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
            obscureText: !widget.secure
                ? false
                : visible
                ? true
                : false,
            obscuringCharacter: "*",
          ),
        ),
      ],
    );
  }
}
