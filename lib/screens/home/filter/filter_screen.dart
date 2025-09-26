import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/controller/filter_search_controller.dart';
import 'package:neat_nest/screens/home/filter/notifier/filter_state.dart';
import 'package:neat_nest/screens/home/filter/widget/category_page_view.dart';
import 'package:neat_nest/screens/home/filter/widget/filter_range.dart';
import 'package:neat_nest/screens/home/filter/widget/filter_rating.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../../utilities/constant/colors.dart';
import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  final List<String> locations = const [
    "Abuja, Nigeria",
    "Osun, Nigeria",
    "Lagos, Nigeria",
    "London, UK",
  ];

  final FilterSearchController _filterSearchController =
      FilterSearchController();

  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(filterStateProvider);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: primaryText(text: 'Filter'),
          leading: AppBarIcon(
            icons: Icons.arrow_back,
            function: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.ht,
              primaryText(text: "Location"),
              10.ht,
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.containerLightBackground,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: DropdownButton<String>(
                  hint: secondaryText(text: "Select a country"),
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  isExpanded: true,
                  value: filterState?.location,
                  underline: SizedBox(),
                  items: locations.map((location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: secondaryText(text: location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(filterStateProvider.notifier)
                          .setLocation(value.toString());
                    }
                  },
                ),
              ),
              20.ht,
              primaryText(text: "Category"),
              20.ht,
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CategoryPageView(index: index);
                  },
                ),
              ),
              20.ht,
              primaryText(text: "Price Range"),
              5.ht,
              FilterRange(),
              // primaryText(text: "Available Date"),
              // 5.ht,
              // DateSelector(initialDate: DateTime.now()),
              10.ht,
              primaryText(text: "Ratings"),
              10.ht,
              SizedBox(
                height: 50.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return FilterRating(index: index);
                  },
                ),
              ),
              20.ht,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppButton(
                    text: "Reset",
                    fontSize: 16.sp,
                    bckColor: AppColors.primaryColor.withOpacity(0.1),
                    textColor: Colors.black,
                    verticalHeight: 12.h,
                    function: () {
                      ref.read(filterStateProvider.notifier).reset();
                    },
                  ),
                  AppButton(
                    text: "Apply",
                    fontSize: 16.sp,
                    bckColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    verticalHeight: 12.h,
                    function: () {
                      _filterSearchController.submit();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
