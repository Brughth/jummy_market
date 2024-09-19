import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/products/business_logic/bloc/products_bloc.dart';
import 'package:marketplace/shared/theme/app_colors.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.bloc});
  final ProductsBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is FetchProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchProductsSuccess) {
              return ListView.builder(
                itemCount: state.products!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.products![index].title),
                  );
                },
              );
            } else if (state is FetchProductsFailure) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ));
  }
}
