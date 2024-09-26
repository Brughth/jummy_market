import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/cart/business_logic/cubit/cart_cubit.dart';
import 'package:marketplace/products/business_logic/bloc/products_bloc.dart';
import 'package:marketplace/products/data/models/products_model.dart';
import 'package:marketplace/service_locator.dart';
import 'package:marketplace/shared/theme/app_colors.dart';

class ProductListWidget extends StatelessWidget {
  final ProductsBloc bloc;
  const ProductListWidget({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is FetchProductsFailure) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  bloc.add(GetProductsEvent());
                },
                child: const Text("Reload"),
              ),
              Center(child: Text(state.message)),
            ],
          );
        }
        if (state is FetchProductsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state.products?.isEmpty ?? true) {
          return const Center(child: Text("No product yet"));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: state.products!.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              var product = state.products![index];

              return ProductCard(
                product: product,
                onPress: () {},
              );
            },
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  });

  final double width, aspectRetio;
  final ProductModel product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: product.images.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: product.images.first,
                        placeholder: (context, url) {
                          return CachedNetworkImage(
                            imageUrl: product.thumbnail,
                          );
                        },
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFF7643),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    getIt.get<CartCubit>().addToCart(product);
                  },
                  child: Stack(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black, width: 1),
                          color: Color.fromARGB(255, 255, 255, 255),
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.add_shopping_cart,
                        size: 20,
                      ),
                    ),
                    // Positioned(
                    //   top: 0,
                    //   right: 0,
                    //   child: Container(
                    //     padding: const EdgeInsets.all(3),
                    //     decoration: const BoxDecoration(
                    //       color: AppColors.red300,
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: Text(
                    //       "${product.quantity}",
                    //       style: const TextStyle(color: AppColors.white),
                    //     ),
                    //   ),
                    // )
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class ProductCard2 extends StatelessWidget {
  const ProductCard2({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  });

  final double width, aspectRetio;
  final ProductModel product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: product.images.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: product.images.first,
                        placeholder: (context, url) {
                          return CachedNetworkImage(
                            imageUrl: product.thumbnail,
                          );
                        },
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFF7643),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    getIt.get<CartCubit>().addToCart(product);
                  },
                  child: Stack(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black, width: 1),
                          color: Color.fromARGB(255, 255, 255, 255),
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.add_shopping_cart,
                        size: 20,
                      ),
                    ),
                    // Positioned(
                    //   top: 0,
                    //   right: 0,
                    //   child: Container(
                    //     padding: const EdgeInsets.all(3),
                    //     decoration: const BoxDecoration(
                    //       color: AppColors.red300,
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: Text(
                    //       "${product.quantity}",
                    //       style: const TextStyle(color: AppColors.white),
                    //     ),
                    //   ),
                    // )
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

