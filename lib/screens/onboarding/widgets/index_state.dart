import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'index_state.g.dart';

@riverpod
class IndexState extends _$IndexState {
  @override
  int build() {
    return 0;
  }

  void indexUpdate(int index) {
    state = index;
  }
}
