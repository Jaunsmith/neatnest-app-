import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neat_nest/screens/user/utilities/verification_options_items_holder.dart';
import 'package:neat_nest/screens/user/widgets/Id_upload_screen.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class VerificationPickerScreen extends StatefulWidget {
  const VerificationPickerScreen({super.key});

  @override
  State<VerificationPickerScreen> createState() =>
      _VerificationPickerScreenState();
}

class _VerificationPickerScreenState extends State<VerificationPickerScreen> {
  late int indent = 0;

  List<String> title = ["Passport", "ID Card", "Driver Licence"];
  List<String> subTitle = [
    "International Passport",
    "NIN or Any Valid Id card",
    "Valid Driver Licence",
  ];
  List<IconData> icons = [
    FontAwesomeIcons.passport,
    FontAwesomeIcons.idCard,
    FontAwesomeIcons.idCard,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: primaryText(text: 'ID Card Verification'),
        leading: AppBarIcon(
          icons: Icons.arrow_back,
          function: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              left: 20.w,
              right: 20.w,
              child: Column(
                children: [
                  10.ht,
                  secondaryText(
                    text:
                        "Please choose the ID Card means you'd like to use to verify your identity. ",
                  ),
                  20.ht,
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final yes = indent == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indent = index;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => IdUploadScreen(index: index),
                              ),
                            );
                          },
                          child: VerificationOptionsItemsHolder(
                            title: title[index],
                            subTitle: subTitle[index],
                            icons: icons[index],
                            textIn: '',
                            isClicked: yes,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 10,
              child: AppButton(
                text: "Continue",
                fontSize: 18.sp,
                bckColor: AppColors.primaryColor,
                textColor: Colors.white,
                function: () {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
