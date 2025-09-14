import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/controller/sign_in_controller.dart';
import 'package:neat_nest/screens/user/auth/icon_holder.dart';
import 'package:neat_nest/screens/user/auth/signin/forget_password_screen.dart';
import 'package:neat_nest/screens/user/auth/signup/sign_up_screen.dart';
import 'package:neat_nest/screens/user/utilities/auth_text_filed.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInController _signInScreenController;
  bool isChecked = false;

  @override
  void didChangeDependencies() {
    _signInScreenController = SignInController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.ht,
                Center(child: primaryText(text: 'Sign In')),
                10.ht,
                AuthTextFiled(
                  titleText: 'Email Address',
                  hintText: 'Enter Email Address',
                  textEditingController:
                      _signInScreenController.emailController,
                  // textEditingController: controller!,
                ),
                10.ht,
                AuthTextFiled(
                  titleText: 'Password',
                  hintText: 'Enter Password',
                  secure: true,
                  textEditingController:
                      _signInScreenController.passwordController,
                ),
                10.ht,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColors.primaryColor,
                          side: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                          value: isChecked,
                          onChanged: (val) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                            _signInScreenController.setChecked(val!);
                          },
                        ),
                        secondaryText(text: 'Remember me', fontSize: 13.sp),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: secondaryText(
                        text: 'Forgot Password',
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                20.ht,
                AppButton(
                  text: 'Sign In',
                  bckColor: AppColors.primaryColor,
                  textColor: Colors.white,
                  width: double.infinity,
                  fontSize: 18.sp,
                  function: () {
                    _signInScreenController.submitData(context);
                  },
                ),
                30.ht,
                DottedLine(dashColor: AppColors.secondaryTextColor),
                20.ht,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconHolder(
                      imagePath:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWryx19r0yjTs-vYzgN8-moMYY9Kf4lWDqrg&s',
                    ),
                    20.wt,
                    iconHolder(
                      imagePath:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdP6AKFlNa3Afg4RJOp7OtR7RGRrlPE2KbLg&s',
                    ),
                  ],
                ),
                30.ht,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    secondaryText(text: 'Don\'t have and account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: secondaryText(
                        text: 'SignUp',
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
