import 'package:neat_nest/models/address_adding_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_list_state.g.dart';

@riverpod
class AddressListState extends _$AddressListState {
  @override
  List<AddressAddingModel> build() {
    return [];
  }

  void addAddress(AddressAddingModel address) {
    state = [...state, address];
  }

  void clearAddresses() {
    state = [];
  }
}
