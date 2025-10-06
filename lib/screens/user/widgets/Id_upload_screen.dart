import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/error_notification.dart';

import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class IdUploadScreen extends StatefulWidget {
  const IdUploadScreen({super.key, required this.index});

  final int index;

  @override
  State<IdUploadScreen> createState() => _IdUploadScreenState();
}

class _IdUploadScreenState extends State<IdUploadScreen> {
  List<String> appBarTitle = [
    "Passport Upload",
    "ID Card Upload",
    "Driver Licence Upload",
  ];
  File? selectedFront;
  File? selectedBack;

  List<String> type = ["Passport", "ID Card", "Driver License"];

  Future<void> selectImage(bool frontImage) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      if (frontImage) {
        setState(() {
          selectedFront = File(result.files.single.path!);
        });
      } else {
        setState(() {
          selectedBack = File(result.files.single.path!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: primaryText(text: appBarTitle[widget.index]),
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
                        "Please  kindly upload a clear picture of the ${type[widget.index]} front and back and make sure all the data are readable  ",
                    color: Colors.red,
                  ),
                  10.ht,
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                      image: selectedFront != null
                          ? DecorationImage(
                              image: FileImage(selectedFront!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: selectedFront != null
                        ? null
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppBarIcon(
                                  icons: Icons.add,
                                  height: 60.h,
                                  width: 60.w,
                                  radius: 30.r,
                                  function: () {
                                    selectImage(true);
                                  },
                                ),
                                5.ht,
                                secondaryText(text: "Upload the front"),
                              ],
                            ),
                          ),
                  ),
                  20.ht,
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                      image: selectedBack != null
                          ? DecorationImage(
                              image: FileImage(selectedBack!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: selectedBack != null
                        ? null
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppBarIcon(
                                  icons: Icons.add,
                                  height: 60.h,
                                  width: 60.w,
                                  radius: 30.r,
                                  function: () {
                                    selectImage(false);
                                  },
                                ),
                                5.ht,
                                secondaryText(text: "Upload the back"),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 150,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppBarIcon(
                      icons: FontAwesomeIcons.rotateRight,
                      height: 60.h,
                      width: 60.w,
                      radius: 30.r,
                      function: () {
                        setState(() {
                          selectedBack = null;
                          selectedFront = null;
                        });
                      },
                    ),
                    5.ht,
                    secondaryText(text: "ReSelect Your ${type[widget.index]}"),
                  ],
                ),
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
                  if (selectedFront == null || selectedBack == null) {
                    showErrorMessage(
                      context,
                      "Kindly Upload both the front and back",
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
