import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neat_nest/screens/onboarding/welcome_screen.dart';
import 'package:neat_nest/utilities/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Neat',
              style: TextStyle(color: AppColors.blackTextColor, fontSize: 22),
            ),
            Text(
              'Nest',
              style: TextStyle(color: AppColors.primaryColor, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
