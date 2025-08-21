import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neat_nest/screens/message/notifier/messages_state.dart';
import 'package:neat_nest/screens/message/utilities/chatting_state.dart';
import 'package:neat_nest/screens/message/widget/chatting_screen.dart';
import 'package:neat_nest/utilities/app_data.dart';
import 'package:neat_nest/utilities/constant/colors.dart';
import 'package:neat_nest/utilities/constant/extension.dart';
import 'package:neat_nest/widget/app_text.dart';

class MessageDataHolder extends ConsumerWidget {
  const MessageDataHolder({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool active = ref.watch(chattingStateProvider);
    final msg = ref.watch(messagesStateProvider);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20.r,
                child: ClipOval(
                  child: CachedNetworkImage(
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    imageUrl: AppData.imagePathway[index],
                  ),
                ),
              ),

              active
                  ? Positioned(
                      bottom: 2,
                      right: 0,
                      child: Icon(
                        Icons.circle,
                        color: AppColors.primaryColor,
                        size: 10.r,
                      ),
                    )
                  : Container(),
            ],
          ),
          10.wt,
          Expanded(
            child: GestureDetector(
              onTap: () {
                debugPrint("The index number clicked is: $index");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChattingScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        primaryText(
                          text: AppData.serviceProviderName[index],
                          fontSize: 15.sp,
                        ),
                        secondaryText(
                          text: msg.first.message,
                          fontSize: 13.sp,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  secondaryText(text: '10:29PM'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
