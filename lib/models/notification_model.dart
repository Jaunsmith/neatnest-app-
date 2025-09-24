class NotificationModel {
  final String title;
  final String message;
  final DateTime datetime;
  bool read;

  NotificationModel({
    required this.title,
    required this.datetime,
    required this.message,
    this.read = false,
  });

  NotificationModel copyWith({
    String? title,
    String? message,
    DateTime? datetime,
    bool? read,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      message: message ?? this.message,
      datetime: datetime ?? this.datetime,
      read: read ?? this.read,
    );
  }
}
