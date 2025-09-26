import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neat_nest/screens/home/filter/notifier/filter_state.dart';

class FilterSearchController {
  FilterSearchController();

  int resetIndex() {
    return -1;
  }

  void submit(WidgetRef ref) {
    String? category;
    String? location;
    String? rating;
    double? minPrice;
    double? maxPrice;
    final update = ref.watch(filterStateProvider);
    category = update?.category;
    location = update?.location;
    minPrice = update?.minPrice;
    maxPrice = update?.maxPrice;
    rating = update?.rating;

    print(
      '$category $rating $location ${minPrice?.toInt().round()} ${maxPrice?.toInt().round()} ',
    );

    ref.read(filterStateProvider.notifier).reset();
  }
}
