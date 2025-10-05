import 'package:flutter/material.dart';

import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class WorkerVerificationScreen extends StatelessWidget {
  const WorkerVerificationScreen({super.key});

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
      body: Container(child: Center(child: Text("Worker Verification screen"))),
    );
  }
}
