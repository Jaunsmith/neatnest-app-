class FilterSearchModel {
  final String? location;
  final String? category;
  final double? minPrice;
  final double? maxPrice;
  final double? rating;

  FilterSearchModel({
    this.location,
    this.category,
    this.minPrice,
    this.maxPrice,
    this.rating,
  });

  // this part let us edit the data despite being final...

  FilterSearchModel copyWith({
    String? location,
    String? category,
    double? maxPrice,
    double? minPrice,
    double? rating,
  }) {
    return FilterSearchModel(
      location: location ?? this.location,
      category: category ?? this.category,
      maxPrice: maxPrice ?? this.maxPrice,
      minPrice: minPrice ?? this.minPrice,
      rating: rating ?? this.rating,
    );
  }
}
