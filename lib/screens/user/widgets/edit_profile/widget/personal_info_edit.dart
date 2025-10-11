import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/controller/edit_profile_controller.dart';
import 'package:neat_nest/screens/user/utilities/auth_text_filed.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_bar_holder.dart';
import 'package:neat_nest/widget/app_text.dart';
import 'package:neat_nest/widget/notificaiton_content.dart';

class PersonalInfoEdit extends StatefulWidget {
  const PersonalInfoEdit({super.key});

  @override
  State<PersonalInfoEdit> createState() => _PersonalInfoEditState();
}

class _PersonalInfoEditState extends State<PersonalInfoEdit> {
  late EditProfileController _editProfileController;
  final List<String> gender = const ["Male", "Female"];
  String? position;

  @override
  void didChangeDependencies() {
    _editProfileController = EditProfileController();
    _editProfileController.verifiedDetails();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    // Auto refresh countdown for UI
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
      if (_editProfileController.canEditDetails()) timer.cancel();
      if (_editProfileController.canUserNameDetails()) timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarHolder(title: "Personal Information"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            10.ht,
            secondaryText(
              text:
                  "Kindly note that your FullName and UserName can only be edited once in 90 days and also will need re-verification",
              color: Colors.red,
            ),
            20.ht,
            AuthTextFiled(
              titleText: "Full Name",
              hintText: "Name",
              textEditingController: _editProfileController.fNameController,
              readOnly: !_editProfileController.canEditDetails(),
              onTap: () {
                if (!_editProfileController.canEditDetails()) {
                  showErrorNotification(
                    context: context,
                    message:
                        "Name can't be edited for security reasons. Wait ${_editProfileController.timeLeft()}s",
                  );
                }
              },
            ),
            20.ht,
            AuthTextFiled(
              titleText: "Username",
              hintText: "Username",
              textEditingController: _editProfileController.userNameController,
              readOnly: !_editProfileController.canUserNameDetails(),
              onTap: () {
                if (!_editProfileController.canUserNameDetails()) {
                  showErrorNotification(
                    context: context,
                    message:
                        "UserName can't be edited for security reasons. Wait ${_editProfileController.userNameTimeLeft()}s",
                  );
                }
              },
            ),
            20.ht,
            AuthTextFiled(
              titleText: "Telephone",
              hintText: "telephone",
              textEditingController:
                  _editProfileController.phoneNumberController,
            ),
            20.ht,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                primaryText(text: "Gender", fontSize: 14.sp),
                5.ht,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBckColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: DropdownButton(
                    hint: secondaryText(text: "Select Gender"),
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    isExpanded: true,
                    value: position,
                    underline: SizedBox(),
                    items: gender.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: secondaryText(text: gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          position = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            30.ht,
            AppButton(
              text: "continue",
              bckColor: AppColors.primaryColor,
              textColor: Colors.white,
              width: double.infinity,
              fontSize: 23.sp,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
