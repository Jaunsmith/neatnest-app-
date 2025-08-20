import 'package:flutter/material.dart';
import 'package:neat_nest/widget/app_text.dart';

class ReBookScreen extends StatelessWidget {
  const ReBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: primaryText(text: 'RE-Booking page')),
    );
  }
}
