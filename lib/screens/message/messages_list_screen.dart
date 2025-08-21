import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/message/widget/message_list_data_holder.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../widget/app_text.dart';
import '../../widget/app_textField.dart';
import '../history/utilities/app_bar_icon.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: primaryText(text: 'Messages'),
          leading: GestureDetector(
            child: AppBarIcon(
              icons: Icons.arrow_back,
              function: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Column(
          children: [
            20.ht,
            AppTextField(hintText: 'Search...', iconPrefix: Icons.search),
            20.ht,
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return MessageDataHolder(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
