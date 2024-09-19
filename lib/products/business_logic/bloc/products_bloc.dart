import 'package:bloc/bloc.dart';
import 'package:marketplace/products/data/models/products_model.dart';
import 'package:marketplace/products/data/repositories/product_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/product_query_filter.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;
  final ProductQueryFilter filter;

  //'emilys'
  //'emilyspass'

  ProductsBloc({
    required this.repository,
    required this.filter,
  }) : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      try {
        emit(FetchProductsLoading());
        final products = await repository.getProducts(
          filter: filter,
        );
        emit(FetchProductsSuccess(products: products));
      } catch (err) {
        emit(FetchProductsFailure(message: err.toString()));
      }
    });
  }
}
