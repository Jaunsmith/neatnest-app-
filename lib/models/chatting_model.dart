class ChatMessageModel {
  final String message;
  final bool isSender;
  final DateTime time;

  ChatMessageModel({
    required this.message,
    required this.isSender,
    required this.time,
  });
}
