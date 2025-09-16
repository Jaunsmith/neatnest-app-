import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_payment_index.g.dart';

@Riverpod(keepAlive: true)
class SelectedPaymentIndex extends _$SelectedPaymentIndex {
  @override
  int build() {
    return 0;
  }

  void pickedIndex(int index) {
    state = index;
  }
}
