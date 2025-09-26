import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neat_nest/screens/home/widget/home_screen_icons.dart';
import 'package:neat_nest/utilities/app_data.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/widget/app_text.dart';

class CategoryPageView extends StatefulWidget {
  const CategoryPageView({super.key, required this.index});

  final int index;

  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  final List<IconData> icons = const [
    FontAwesomeIcons.broom,
    FontAwesomeIcons.hammer,
    FontAwesomeIcons.paintRoller,
  ];

  bool categoryPicked = false;
  int clickedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isSelected = clickedIndex == widget.index;
    return GestureDetector(
      onTap: () {
        setState(() {
          clickedIndex = widget.index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        padding: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
        margin: EdgeInsets.only(left: 10.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.containerLightBackground,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeScreenIcons(
              radius: 10.r,
              icons: icons[widget.index],
              width: 40.w,
              height: 40.h,
              iconColor: categoryPicked ? Colors.white : AppColors.primaryColor,
            ),
            secondaryText(
              text: AppData.serviceName[widget.index],
              color: categoryPicked
                  ? Colors.white
                  : AppColors.secondaryTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
