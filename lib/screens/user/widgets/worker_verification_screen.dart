import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/user/widgets/verification_method_screen.dart';
import 'package:neat_nest/screens/user/widgets/verification_start_screen.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';

import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class WorkerVerificationScreen extends StatefulWidget {
  const WorkerVerificationScreen({super.key});

  @override
  State<WorkerVerificationScreen> createState() =>
      _WorkerVerificationScreenState();
}

class _WorkerVerificationScreenState extends State<WorkerVerificationScreen> {
  late int index = 0;

  List<Widget> pages = [VerificationStartScreen(), VerificationMethodScreen()];

  List<String> buttonText = ["Start", "Continue", "Continue"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: primaryText(text: 'Identity Verification'),
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
            Positioned.fill(left: 20.w, right: 20.w, child: pages[index]),
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 10,
              child: AppButton(
                text: buttonText[index],
                fontSize: 18.sp,
                bckColor: AppColors.primaryColor,
                textColor: Colors.white,
                function: () {
                  setState(() {
                    index++;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
