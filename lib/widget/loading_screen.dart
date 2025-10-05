import 'package:flutter/material.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor.withValues(alpha: 0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: FittedBox(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                    strokeWidth: 6,
                  ),
                ),
              ),
              20.ht,
              primaryText(text: "loading........"),
            ],
          ), // spinner
        ),
      ),
    );
  }
}
