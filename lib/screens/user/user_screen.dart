import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/user/auth/signin/sign_in_screen.dart';
import 'package:neat_nest/screens/user/auth/signup/sign_up_screen.dart';
import 'package:neat_nest/screens/user/user_profile_screen.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key, required this.isDataAvailable});
  final bool isDataAvailable;
  @override
  Widget build(BuildContext context) {
    return isDataAvailable
        ? UserProfileScreen()
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  text: 'Sign up',
                  bckColor: AppColors.primaryColor,
                  textColor: Colors.white,
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  fontSize: 24.sp,
                ),
                40.ht,
                AppButton(
                  text: 'Sign IN',
                  bckColor: AppColors.primaryColor.withOpacity(0.1),
                  textColor: AppColors.primaryColor,
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  fontSize: 24.sp,
                ),
              ],
            ),
          );
  }
}
