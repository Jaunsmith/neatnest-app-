import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_date_state.g.dart';

@Riverpod(keepAlive: true)
class BookingDateState extends _$BookingDateState {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void pickedDate(DateTime date) {
    state = date;
  }
}
