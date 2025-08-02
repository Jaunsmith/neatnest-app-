import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/onboarding/widgets/index_state.dart';
import 'package:neat_nest/screens/onboarding/widgets/introduction_screens.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/widget/app_text.dart';

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({super.key});

  final List<IntroductionScreens> introScreens = [
    IntroductionScreens(
      bigText: 'Professional Home Help, Right when you need it',
      smallText:
          'Get trusted home services at your convenience. From cleaning to repairs, we connect you with skilled professionals who arrive right when you need them making home care simple, reliable, and stress free',
    ),
    IntroductionScreens(
      bigText: 'Pick a service , choose a time and we will render the rest ',
      smallText:
          'Easily schedule cleaning, repairs, or other home services at your convenience. Select what you need, set the time that works best for you, and let our professionals take care of everything while you relax',
    ),
  ];

  final List<String> imagePath = [
    'https://cdn.prod.website-files.com/662a9a0b1860cf22db41bd69/662ff7377dec6027e008a4ac_Professional%20cleaning%20service%20(1).webp',
    'https://media.istockphoto.com/id/906777508/photo/portrait-of-diverse-janitors.jpg?s=612x612&w=0&k=20&c=egjW49zTzRtNqvq1tCVYzmxq8SJW4GK0dRGaJ7aet90=',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(indexStateProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imagePath[index]),
                ),
              ),
            ),
            Positioned(
              top: 400.h,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 5.h, sigmaX: 5.w),
                  child: Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.2),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(top: 500, child: introScreens[index]),
            Positioned(
              bottom: 130.h,
              child: DotsIndicator(
                dotsCount: introScreens.length,
                position: index.toDouble(),
                decorator: DotsDecorator(
                  size: Size.square(9),
                  activeColor: AppColors.primaryColor,
                  activeSize: Size(20.w, 8.h),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onTap: (value) {
                  debugPrint("the index number is $value");
                  ref.read(indexStateProvider.notifier).indexUpdate(value);
                },
              ),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        debugPrint("routing to homepage");
                      },
                      child: primaryText(
                        text: 'skip',
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (index < 1) {
                          ref
                              .read(indexStateProvider.notifier)
                              .indexUpdate(index + 1);
                        } else {
                          debugPrint(
                            "The home page from the welcome screen us clicked",
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: primaryText(text: 'Next', color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
