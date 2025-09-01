import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterRange extends StatefulWidget {
  const FilterRange({super.key});

  @override
  State<FilterRange> createState() => _FilterRangeState();
}

class _FilterRangeState extends State<FilterRange> {
  SfRangeValues _values = SfRangeValues(50, 1000);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfRangeSlider(
          min: 10,
          max: 1000,
          activeColor: AppColors.primaryColor,
          inactiveColor: AppColors.secondaryTextColor.withOpacity(0.3),
          values: _values,
          showTicks: false,
          enableTooltip: false,
          showLabels: false,
          onChanged: (SfRangeValues newValue) {
            setState(() {
              _values = newValue;
            });
          },
        ),
        10.ht,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
              width: MediaQuery.of(context).size.width * 0.43,
              height: 70.h,
              decoration: BoxDecoration(
                color: AppColors.containerLightBackground,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  secondaryText(text: "Minimum Price", fontSize: 12.sp),
                  5.ht,
                  primaryText(
                    text: "\$ ${_values.start.round()}.00",
                    fontSize: 17.sp,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
              width: MediaQuery.of(context).size.width * 0.43,
              height: 70.h,
              decoration: BoxDecoration(
                color: AppColors.containerLightBackground,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  secondaryText(text: "Maximum Price", fontSize: 12.sp),
                  5.ht,
                  primaryText(
                    text: "\$ ${_values.end.round()}.00",
                    fontSize: 17.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
