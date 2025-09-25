import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/controller/sign_up_controller.dart';
import 'package:neat_nest/screens/user/auth/icon_holder.dart';
import 'package:neat_nest/screens/user/auth/signin/sign_in_screen.dart';
import 'package:neat_nest/screens/user/utilities/auth_text_filed.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpController _signUpController;
  bool isChecked = false;

  final List<String> roles = const ["User", "Service Provider"];
  String? position;

  @override
  void didChangeDependencies() {
    _signUpController = SignUpController();
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
                Center(child: primaryText(text: 'Sign Up')),
                10.ht,
                AuthTextFiled(
                  titleText: 'Name',
                  hintText: 'Enter Full Name',
                  textEditingController: _signUpController.nameController,
                  // textEditingController: controller!,
                ),
                10.ht,
                AuthTextFiled(
                  titleText: 'Email Address',
                  hintText: 'Enter Email Address',
                  textEditingController: _signUpController.emailController,
                  // textEditingController: controller!,
                ),
                10.ht,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    primaryText(text: "Role", fontSize: 14.sp),
                    5.ht,
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldBckColor.withValues(
                          alpha: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: DropdownButton(
                        hint: secondaryText(text: "Select Role"),
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        isExpanded: true,
                        value: position,
                        underline: SizedBox(),
                        items: roles.map((role) {
                          return DropdownMenuItem(
                            value: role,
                            child: secondaryText(text: role),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              position = value;
                            });
                            _signUpController.setRole(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                10.ht,
                AuthTextFiled(
                  titleText: 'Password',
                  hintText: 'Enter Password',
                  secure: true,
                  textEditingController: _signUpController.passwordController,
                  // textEditingController: controller!,
                ),
                10.ht,
                AuthTextFiled(
                  titleText: 'Password',
                  hintText: 'Enter Password',
                  secure: true,
                  textEditingController:
                      _signUpController.confirmPasswordController,
                  // textEditingController: controller!,
                ),
                10.ht,
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      side: BorderSide(color: AppColors.primaryColor, width: 2),
                      value: isChecked,
                      onChanged: (val) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                        _signUpController.setChecked(val!);
                      },
                    ),
                    secondaryText(text: 'I agree to the', fontSize: 13.sp),
                    primaryText(
                      text: 'Terms and Conditions',
                      color: AppColors.primaryColor,
                      fontSize: 13.sp,
                    ),
                  ],
                ),
                20.ht,
                AppButton(
                  text: 'Submit',
                  bckColor: AppColors.primaryColor,
                  textColor: Colors.white,
                  width: double.infinity,
                  fontSize: 18.sp,
                  function: () {
                    _signUpController.testingData(context);
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
                    secondaryText(text: 'Already have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: secondaryText(
                        text: 'SignIn',
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
