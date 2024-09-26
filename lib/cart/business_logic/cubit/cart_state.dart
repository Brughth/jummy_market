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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory CartState.fromJson(Map<String, dynamic> map) {
    return CartState(
      products: List<ProductModel>.from(
        (map['products'] as List<int>).map<ProductModel>(
          (x) => ProductModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
