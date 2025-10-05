import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neat_nest/screens/user/utilities/verification_options_items_holder.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class VerificationMethodScreen extends StatefulWidget {
  const VerificationMethodScreen({super.key});

  @override
  State<VerificationMethodScreen> createState() =>
      _VerificationMethodScreenState();
}

class _VerificationMethodScreenState extends State<VerificationMethodScreen> {
  late int indent = 0;

  List<String> title = [
    "ID Card Verification",
    "Address Verification",
    "Selfie Verification",
  ];

  List<String> subTitle = [
    "Government Issued ID Card",
    "Kindly Upload your Utility Bills",
    "Kindly take a selfie",
  ];

  List<IconData> icons = [
    FontAwesomeIcons.file,
    FontAwesomeIcons.locationDot,
    FontAwesomeIcons.cameraRotate,
  ];

  List<bool> verify = [true, false, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.ht,
        secondaryText(
          text:
              "Kindly Kick start your verification, below is the verifcation required ",
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
                },
                child: VerificationOptionsItemsHolder(
                  title: title[index],
                  subTitle: subTitle[index],
                  icons: icons[index],
                  isClicked: yes,
                  isVerified: verify[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
