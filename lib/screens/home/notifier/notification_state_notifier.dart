import 'package:neat_nest/models/notification_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_state_notifier.g.dart';

@riverpod
class NotificationStateNotifier extends _$NotificationStateNotifier {
  @override
  List<NotificationModel> build() {
    return [
      NotificationModel(
        title: "Welcome!",
        message: "Texting today fata for me 🎉",
        datetime: DateTime.now(),
      ),
      NotificationModel(
        title: "Offer",
        message: "You got 20% discount!",
        datetime: DateTime.now().subtract(Duration(hours: 5)),
      ),
      NotificationModel(
        title: "Reminder",
        message: "Your subscription expires soon.",
        datetime: DateTime.now().subtract(Duration(days: 1)),
      ),
      NotificationModel(
        title: "Update",
        message: "New features are available.",
        datetime: DateTime.now().subtract(Duration(days: 4)),
      ),
      NotificationModel(
        title: "Update",
        message: "New features are available.",
        datetime: DateTime.now().subtract(Duration(days: 10)),
      ),
    ];
  }

  // ✅ Add new notification
  void addNotification(NotificationModel notif) {
    state = [...state, notif];
  }

  void markAsRead(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[i].copyWith(read: true) else state[i],
    ];
  }

  void delete(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  void markAllAsRead() {
    state = [for (final n in state) n.copyWith(read: true)];
  }
}
