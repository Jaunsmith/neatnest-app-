import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_notifiers.g.dart';

@riverpod
class BottomNavNotifiers extends _$BottomNavNotifiers {
  @override
  int build() {
    return 0;
  }

  void indexUpdate(int index) {
    state = index;
  }
}
