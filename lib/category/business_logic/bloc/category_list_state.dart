part of 'category_list_bloc.dart';

@immutable
sealed class CategoryListState {
  final String? message;
  final List<String>? categories;

  const CategoryListState({
    this.categories,
    this.message,
  });
}

final class CategoryListInitial extends CategoryListState {}

final class FetchCategoryListLoading extends CategoryListState {}

final class FetchCategoryListFailure extends CategoryListState {
  const FetchCategoryListFailure({required super.message});
}

final class FetchCategoryListSuccess extends CategoryListState {
  const FetchCategoryListSuccess({required super.categories});
}
