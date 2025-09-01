import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_state.g.dart';

@Riverpod(keepAlive: true)
class FilterState extends _$FilterState {
  @override
  String build() {
    return "";
  }

  void filterState(String pickedLocations) {
    state = pickedLocations;
  }
}
