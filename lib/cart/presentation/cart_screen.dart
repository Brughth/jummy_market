import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/cart/business_logic/cubit/cart_cubit.dart';
import 'package:marketplace/category/presentation/widgets/horizontal_categories_widget.dart';
import 'package:marketplace/products/data/models/products_model.dart';
import 'package:marketplace/service_locator.dart';
import 'package:marketplace/shared/extensions/context_extensions.dart';
import 'package:marketplace/shared/theme/app_colors.dart';
import 'package:marketplace/shared/widgets/app_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.products.isEmpty) {
            return Center(
              child: Text('Your cart is Empty'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return CartItem(product: product);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
                ),
                child: AppButton(
                  bgColor: AppColors.primary,
                  text: "Pay ${state.totalAmount1.toStringAsFixed(2)}\$",
                  textStyle: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Dismissible(
        key: Key(product.id.toString()),
        onDismissed: (direction) {
          getIt.get<CartCubit>().removeToCart(product);
        },
        child: ListTile(
          tileColor: AppColors.gray100,
          leading: product.images.isNotEmpty
              ? CachedNetworkImage(
                  width: 120,
                  height: 180,
                  imageUrl: product.images.first,
                  placeholder: (context, url) {
                    return CachedNetworkImage(
                      imageUrl: product.images.isNotEmpty
                          ? product.images.first
                          : product.thumbnail,
                    );
                  },
                )
              : null,
          title: Text(product.title),
          subtitle: Text(product.category),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 12),
                  onPressed: () {
                    context.read<CartCubit>().decrementQuantity(product);
                  },
                ),
                Text('${product.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add, size: 12),
                  onPressed: () {
                    context.read<CartCubit>().incrementQuantity(product);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
