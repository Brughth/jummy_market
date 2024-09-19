part of 'products_bloc.dart';

@immutable
class ProductsState {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductsModel> products;

  const ProductsSuccess({required this.products});
}

final class ProductsFailure extends ProductsState {
  final String message;
  const ProductsFailure({required this.message});
}

