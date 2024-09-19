// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductQueryFilter {
  final int limit;
  final String? search;
  final int? skip;
  final String? sortBy;
  final String order;
  final String? category;

  ProductQueryFilter({
    this.limit = 20,
    this.order = 'asc',
    this.search,
    this.skip,
    this.sortBy,
    this.category,
  });

  ProductQueryFilter copyWith({
    int? limit,
    String? search,
    int? skip,
    String? sortBy,
    String? order,
    String? category,
  }) {
    return ProductQueryFilter(
      limit: limit ?? this.limit,
      search: search ?? this.search,
      skip: skip ?? this.skip,
      sortBy: sortBy ?? this.sortBy,
      order: order ?? this.order,
      category: category ?? this.category,
    );
  }
}
