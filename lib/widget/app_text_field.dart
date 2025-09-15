import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.iconSuffix,
    this.iconPrefix,
    this.function,
  });

  final String? hintText;
  final IconData? iconSuffix;
  final IconData? iconPrefix;
  final VoidCallback? function;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      child: TextField(
        decoration: InputDecoration(
          fillColor: AppColors.containerLightBackground,
          filled: true,
          hintStyle: TextStyle(color: AppColors.secondaryTextColor),
          hintText: widget.hintText ?? '',
          suffixIcon: widget.iconSuffix != null
              ? GestureDetector(
                  onTap: widget.function,
                  child: Icon(
                    widget.iconSuffix,
                    color: AppColors.secondaryTextColor,
                  ),
                )
              : null,
          prefixIcon: widget.iconPrefix != null
              ? Icon(widget.iconPrefix, color: AppColors.secondaryTextColor)
              : null,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.secondaryTextColor),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
        ),
      ),
    );
  }
}
