import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/cart/business_logic/cubit/cart_cubit.dart';
import 'package:marketplace/products/data/models/products_model.dart';
import 'package:marketplace/shared/theme/app_colors.dart';

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

          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return CartItem(product: product);
            },
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
        // IconButton(
        //       icon: Icon(Icons.delete),
        //       onPressed: () {
        //         context.read<CartCubit>().removeToCart(product);
        //       },
        //     ),
      ),
    );
  }
}
