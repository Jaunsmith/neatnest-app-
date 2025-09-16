import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rooms_count_state.g.dart';

@Riverpod(keepAlive: true)
class RoomsCountState extends _$RoomsCountState {
  @override
  int build(int index) {
    return 0;
  }

  void increasement() {
    state++;
  }

  void decreasement() {
    if (state == 0) {
      state = 0;
    } else {
      state--;
    }
  }
}
