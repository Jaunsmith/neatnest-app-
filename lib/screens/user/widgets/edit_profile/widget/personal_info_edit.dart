import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/controller/edit_profile_controller.dart';
import 'package:neat_nest/screens/user/utilities/auth_text_filed.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_bar_holder.dart';
import 'package:neat_nest/widget/app_text.dart';

class PersonalInfoEdit extends StatefulWidget {
  const PersonalInfoEdit({super.key});

  @override
  State<PersonalInfoEdit> createState() => _PersonalInfoEditState();
}

class _PersonalInfoEditState extends State<PersonalInfoEdit> {
  late EditProfileController _editProfileController;

  @override
  void didChangeDependencies() {
    _editProfileController = EditProfileController();
    super.didChangeDependencies();
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
              titleText: "Full NAme",
              hintText: "Name",
              textEditingController: _editProfileController.fNameController,
              readOnly: true,
            ),
            20.ht,
            AuthTextFiled(
              titleText: "Username",
              hintText: "Username",
              textEditingController: _editProfileController.fNameController,
              readOnly: true,
            ),
            20.ht,
            AuthTextFiled(
              titleText: "Telephone",
              hintText: "telephone",
              textEditingController: _editProfileController.fNameController,
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
