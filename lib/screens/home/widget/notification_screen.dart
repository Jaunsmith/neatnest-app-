import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:neat_nest/screens/home/notifier/notification_state_notifier.dart';
import 'package:neat_nest/screens/home/utilities/notification_screen_holder.dart';
import 'package:neat_nest/utilities/constant/extension.dart';

import '../../../models/notification_model.dart';
import '../../../widget/app_text.dart';
import '../../history/utilities/app_bar_icon.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  Map<String, List<NotificationModel>> groupNotifications(
    List<NotificationModel> notifications,
  ) {
    final Map<String, List<NotificationModel>> grouped = {};

    for (var notif in notifications) {
      // convert to local date/time to avoid timezone issues
      final local = notif.datetime.toLocal();

      // create a date-only key with ISO-like format for stable lexical sorting
      final dateOnly = DateTime(local.year, local.month, local.day);
      final key = DateFormat('yyyy-MM-dd').format(dateOnly);

      grouped.putIfAbsent(key, () => []).add(notif);
    }

    return grouped;
  }

  String friendlyLabelFromKey(String key) {
    final date = DateFormat('yyyy-MM-dd').parse(key);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final diffDays = today.difference(date).inDays;

    if (diffDays == 0) return 'Today';
    if (diffDays == 1) return 'Yesterday';
    if (diffDays < 7) return DateFormat('EEEE').format(date); // e.g., 'Monday'
    return DateFormat('dd MMM yyyy').format(date); // e.g., '24 Sep 2025'
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notification = ref.watch(notificationStateNotifierProvider);
    final groupedNotification = groupNotifications(notification);
    final keys = groupedNotification.keys.toList()
      ..sort((a, b) => b.compareTo(a));
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: primaryText(text: 'Notifications'),
          centerTitle: false,
          leading: AppBarIcon(
            icons: Icons.arrow_back,
            function: () {
              Navigator.pop(context);
            },
          ),
          actions: [AppBarIcon(icons: Icons.more_vert, function: () {})],
        ),
        body: Column(
          children: [
            20.ht,
            Expanded(
              child: ListView.builder(
                itemCount: keys.length,
                itemBuilder: ((context, outerIndex) {
                  final key = keys[outerIndex]; // e.g. '2025-09-24'
                  final items =
                      groupedNotification[key]!; // list of NotificationModel
                  final label = friendlyLabelFromKey(key);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      primaryText(text: label),
                      20.ht,
                      ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          final notif = items[index];
                          return GestureDetector(
                            onTap: () {
                              final globalIndex = notification.indexOf(notif);
                              ref
                                  .read(
                                    notificationStateNotifierProvider.notifier,
                                  )
                                  .markAsRead(globalIndex);
                            },
                            child: NotificationScreenHolder(
                              title: notif.title,
                              message: notif.message,
                              date: notif.datetime,
                              read: notif.read,
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
