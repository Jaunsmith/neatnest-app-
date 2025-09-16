import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_add_index_state.g.dart';

@Riverpod(keepAlive: true)
class SelectedAddIndexState extends _$SelectedAddIndexState {
  @override
  int build() {
    return 0;
  }

  void indexSelected(int index) {
    state = index;
  }
}
