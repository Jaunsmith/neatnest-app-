import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_index_state.g.dart';

@riverpod
class HomeScreenIndexState extends _$HomeScreenIndexState {
  @override
  int build() {
    return 0;
  }

  void homeIndexUpdate(int index) {
    state = index;
  }

  void toggleAutoScroll(bool isAutoScrolling) {
    state = isAutoScrolling ? state : -1; // Using -1 to indicate manual control
  }
}
