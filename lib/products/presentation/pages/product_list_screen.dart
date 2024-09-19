import 'package:flutter/material.dart';
import 'package:marketplace/products/business_logic/bloc/products_bloc.dart';
import 'package:marketplace/products/presentation/widgets/product_list_widget.dart';

class ProductListScreen extends StatelessWidget {
  final ProductsBloc bloc;
  final String title;

  const ProductListScreen({
    super.key,
    required this.bloc,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ProductListWidget(
        bloc: bloc,
      ),
    );
  }
}
