import 'package:bloc/bloc.dart';
import 'package:marketplace/products/data/models/products_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(
          CartState(products: []),
        );

  int _getIndex(ProductModel product) {
    return state.products.indexWhere((element) => element.id == product.id);
  }

  bool _isInCart(ProductModel product) {
    return _getIndex(product) >= 0;
  }

  incrementQuantity(ProductModel product) {
    // var quantity = state.products[_getIndex(product)].quantity ?? 1;
    // var newProduct = product.copyWith(quantity: quantity + 1);
    // var products = [...state.products];
    // products[_getIndex(product)] = newProduct;

    if (_isInCart(product)) {
      var index = _getIndex(product);
      var currentProduct = state.products[index];
      var newProduct =
          currentProduct.copyWith(quantity: (currentProduct.quantity ?? 0) + 1);
      var products = [...state.products];
      products[index] = newProduct;

      emit(
        CartState(products: products),
      );
    }
  }

  addToCart(ProductModel product) {
    if (_isInCart(product)) {
      incrementQuantity(product);
    } else {
      emit(
        CartState(
          products: [
            ...state.products,
            product.copyWith(quantity: 1),
          ],
        ),
      );
    }
  }

  removeToCart(ProductModel product) {
    if (_isInCart(product)) {
      var products = [...state.products];

      products.removeAt(_getIndex(product));

      emit(
        CartState(products: products),
      );
    }
  }

  decrementQuantity(ProductModel product) {
    // if ((product.quantity ?? 1) > 1) {
    //   var quantity = state.products[_getIndex(product)].quantity ?? 1;
    //   var newProduct = product.copyWith(quantity: quantity - 1);
    //   var products = [...state.products];
    //   products[_getIndex(product)] = newProduct;
    //   emit(
    //     CartState(products: products),
    //   );
    // } else {
    //   removeToCart(product);
    // }

    if (_isInCart(product)) {
      var index = _getIndex(product);
      var currentProduct = state.products[index];

      if ((currentProduct.quantity ?? 1) > 1) {
        var newProduct = currentProduct.copyWith(
            quantity: (currentProduct.quantity ?? 0) - 1);
        var products = [...state.products];
        products[index] = newProduct;

        emit(
          CartState(products: products),
        );
      } else {
        removeToCart(product);
      }
    }
  }
}
