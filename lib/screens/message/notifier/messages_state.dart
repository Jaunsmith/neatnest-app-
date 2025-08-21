import 'package:neat_nest/models/chatting_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_state.g.dart';

@riverpod
class MessagesState extends _$MessagesState {
  @override
  List<ChatMessageModel> build() {
    return [
      ChatMessageModel(message: '', isSender: false, time: DateTime.now()),
    ];
  }

  void sendNewMessage(String text, {bool isSender = true}) {
    state = [
      ChatMessageModel(message: text, isSender: isSender, time: DateTime.now()),
      ...state, //...State is a spread it means take all existing state list ans put this this set the new data to index 0
    ];
  }
}
