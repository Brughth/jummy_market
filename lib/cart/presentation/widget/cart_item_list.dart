// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:marketplace/cart/business_logic/cubit/cart_cubit.dart';
// import 'package:marketplace/products/data/models/products_model.dart';
// import 'package:marketplace/service_locator.dart';

// // class CartItemList extends StatelessWidget {
// //   const CartItemList({super.key, required this.product});
// //   final ProductModel product;
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListTile(
// //       leading: product.images.isNotEmpty
// //           ? CachedNetworkImage(
// //               imageUrl: product.images.first,
// //               placeholder: (context, url) {
// //                 return CachedNetworkImage(
// //                   imageUrl: product.thumbnail,
// //                 );
// //               },
// //             )
// //           : null,
// //       title: Text(
// //         product.title,
// //         style: Theme.of(context).textTheme.bodyMedium,
// //         maxLines: 2,
// //       ),
// //       subtitle: Text("\$${product.price}"),
// //       trailing: Row(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           IconButton(
// //               onPressed: getIt.get<CartCubit>().decrementQuantity(product),
// //               icon: const Icon(Icons.remove)),
// //           Text("${product.quantity ?? 1}"),
// //           IconButton(
// //               onPressed: getIt.get<CartCubit>().incrementQuantity(product),
// //               icon: const Icon(Icons.add)),
// //         ],
// //       ),
// //     );
// //   }
// // }


// bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Checkbox(value: false, onChanged: (value) {}),
//                 Text('All'),
//               ],
//             ),
//             ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.red300,
//                     padding: EdgeInsets.symmetric(horizontal: 20)),
//                 child: const Text("Checkout"))
//           ],
//         ),
//       ),


//       Container(
//                 padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.remove, size: 12),
//                       onPressed: () {
//                         context.read<CartCubit>().decrementQuantity(product);
//                       },
//                     ),
//                     Text('${product.quantity}'),
//                     IconButton(
//                       icon: Icon(Icons.add, size: 12),
//                       onPressed: () {
//                         context.read<CartCubit>().incrementQuantity(product);
//                       },
//                     ),
//                   ],
//                 ),
//               ),



