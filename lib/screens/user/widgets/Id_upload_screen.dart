import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neat_nest/screens/user/notifiers/data_flow_state.dart';
import 'package:neat_nest/utilities/app_button.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/error_notification.dart';
import 'package:path_provider/path_provider.dart';

import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class IdUploadScreen extends ConsumerStatefulWidget {
  const IdUploadScreen({super.key});

  @override
  ConsumerState<IdUploadScreen> createState() => _IdUploadScreenState();
}

class _IdUploadScreenState extends ConsumerState<IdUploadScreen> {
  List<List<String>> appBarTitle = [
    ["Passport Upload", "ID Card Upload", "Driver Licence Upload"],
    ["Utility Bills Upload", "Bank Statement Upload"],
    ["Selfie Upload"],
  ];
  File? selectedFront;
  File? selectedBack;
  final picker = ImagePicker();

  late bool isLoading = false;

  List<List<String>> type = [
    ["Passport", "ID Card", "Driver License"],
    ["Utility Bills", "Bank Statement"],
    ["selfie"],
  ];

  Future<File?> _compressImage(File file) async {
    try {
      final dir = await getTemporaryDirectory();
      final targetPath =
          '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final output = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 80,
        minHeight: 800,
        minWidth: 1000,
      );

      if (output != null && await File(output.path).exists()) {
        final compressedFile = File(output.path);
        if (kDebugMode) {
          print(
            'Compression successful: ${file.lengthSync() ~/ 1024}KB → ${compressedFile.lengthSync() ~/ 1024}KB',
          );
        }
        return compressedFile;
      } else {
        if (kDebugMode) {
          print('Compression failed, returning original file');
        }
        return file;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Compression error: $e');
      }
      return file;
    }
  }

  Future<void> selectImage(bool frontImage, ImageSource source) async {
    try {
      final result = await picker.pickImage(source: source, imageQuality: 100);

      setState(() {
        isLoading = true;
      });

      if (result != null) {
        File pickedImage = File(result.path);
        File? compressedImage = await _compressImage(pickedImage);
        if (compressedImage != null) {
          setState(() {
            if (frontImage) {
              selectedFront = compressedImage;
            } else {
              selectedBack = compressedImage;
            }
            isLoading = false;
          });
        } else {
          setState(() => isLoading = false);
        }
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      print(e);
      setState(() => isLoading = false);
    }
  }

  void showImageSource(bool frontImage) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
              bottom: Radius.circular(10.r),
            ),
          ),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.blue),
                title: Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  selectImage(frontImage, ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.green),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  selectImage(frontImage, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final identity = ref.read(dataFlowStateProvider);

    final identityIndex = identity[0].identityVerifyIndex ?? 0;
    final methodIndex = identity[0].methodVerifyIndex ?? 0;

    // SAFE TITLE ACCESS
    String titleText;
    if (methodIndex < appBarTitle.length &&
        identityIndex < appBarTitle[methodIndex].length) {
      titleText = appBarTitle[methodIndex][identityIndex];
    } else if (methodIndex < appBarTitle.length) {
      titleText = appBarTitle[methodIndex][0]; // Use first item as fallback
    } else {
      titleText = "Upload"; // Final fallback
    }

    // SAFE TYPE ACCESS
    String documentType;
    if (methodIndex < type.length && identityIndex < type[methodIndex].length) {
      documentType = type[methodIndex][identityIndex];
    } else if (methodIndex < type.length) {
      documentType = type[methodIndex][0]; // Use first item as fallback
    } else {
      documentType = "document"; // Final fallback
    }

    // Check if this is selfie verification (methodIndex 2)
    bool isSelfie = methodIndex == 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: primaryText(text: titleText),
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
                    text: isSelfie
                        ? "Snap a quick selfie for identity verification Ensure your face is well-lit and visible. We'll keep it secure."
                        : "Please kindly upload a clear picture of the $documentType front and back and make sure all the data are readable",
                    color: Colors.red,
                  ),
                  10.ht,

                  // FRONT IMAGE/UPLOAD
                  Container(
                    height: isSelfie ? 250.h : 150.h,
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
                            child: isLoading
                                ? CircularProgressIndicator.adaptive(
                                    backgroundColor: AppColors.primaryColor,
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppBarIcon(
                                        icons: Icons.add_a_photo,
                                        height: 60.h,
                                        width: 60.w,
                                        radius: 30.r,
                                        function: () => showImageSource(true),
                                      ),
                                      5.ht,
                                      secondaryText(
                                        text: isSelfie
                                            ? "Take Selfie"
                                            : "Upload the front",
                                      ),
                                    ],
                                  ),
                          ),
                  ),

                  // ONLY SHOW BACK UPLOAD FOR DOCUMENTS (NOT SELFIE)
                  if (!isSelfie) ...[
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
                              child: isLoading
                                  ? CircularProgressIndicator.adaptive(
                                      backgroundColor: AppColors.primaryColor,
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppBarIcon(
                                          icons: Icons.add_a_photo,
                                          height: 60.h,
                                          width: 60.w,
                                          radius: 30.r,
                                          function: () =>
                                              showImageSource(false),
                                        ),
                                        5.ht,
                                        secondaryText(text: "Upload the back"),
                                      ],
                                    ),
                            ),
                    ),
                  ],
                ],
              ),
            ),

            // RESET BUTTON
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
                    secondaryText(
                      text: isSelfie
                          ? "Retake Selfie"
                          : "Reselect Your $documentType",
                    ),
                  ],
                ),
              ),
            ),

            // CONTINUE BUTTON
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
                  if (isSelfie) {
                    // Selfie only needs front image
                    if (selectedFront == null) {
                      showErrorMessage(context, "Kindly take a selfie");
                    } else {
                      // Proceed with selfie upload
                      print("Selfie uploaded successfully");
                    }
                  } else {
                    // Documents need both front and back
                    if (selectedFront == null || selectedBack == null) {
                      showErrorMessage(
                        context,
                        "Kindly Upload both the front and back of your $documentType",
                      );
                    } else {
                      // Proceed with document upload
                      print("$documentType uploaded successfully");
                    }
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
