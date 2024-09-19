part of 'products_bloc.dart';

@immutable
class ProductsState {
  final List<ProductModel>? products;
  const ProductsState({
    this.products,
  });
}

final class ProductsInitial extends ProductsState {}

final class FetchProductsLoading extends ProductsState {}

final class FetchProductsSuccess extends ProductsState {
  const FetchProductsSuccess({required super.products});
}

final class FetchProductsFailure extends ProductsState {
  final String message;
  const FetchProductsFailure({required this.message});
}
