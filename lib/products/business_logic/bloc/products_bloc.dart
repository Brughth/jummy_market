import 'package:bloc/bloc.dart';
import 'package:marketplace/products/data/models/products_model.dart';
import 'package:marketplace/products/data/repositories/product_repository.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;

  ProductsBloc(this.repository) : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      try {
        emit(ProductsLoading());
        final products = await repository.getProducts();
        emit(ProductsSuccess(products: products)); 
      } catch (err) {
        emit(ProductsFailure(message: err.toString()));
      }
    });
  }
}
