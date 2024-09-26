// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

class CartState {
  final List<ProductModel> products;

  double get totalAmount1 {
    var total = 0.0;

    for (var product in products) {
      var price = product.price * (product.quantity ?? 0);

      total = total + price;
    }

    return total;
  }

  double get totalAmount2 => products.fold(0.0, (p, e) => p + e.totalPrice);

  CartState({
    required this.products,
  });
}
