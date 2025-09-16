import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/history/utilities/app_bar_icon.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icons,
    required this.index,
    required this.selectedIndex,
    required this.onChange,
  });

  final String title;
  final String subTitle;
  final IconData icons;
  final int index;
  final int selectedIndex;
  final ValueChanged onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.only(top: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.containerLightBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarIcon(
                icons: icons,
                function: () {},
                iconColor: AppColors.primaryColor,
                bckColor: AppColors.primaryColor.withValues(alpha: 0.1),
              ),
              10.wt,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    primaryText(text: title),
                    10.ht,
                    secondaryText(text: subTitle),
                  ],
                ),
              ),
            ],
          ),
          Radio<int>(
            value: index,
            activeColor: AppColors.primaryColor,
            groupValue: selectedIndex,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
