import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/category/presentation/widgets/horizontal_categories_widget.dart';
import 'package:marketplace/products/business_logic/bloc/products_bloc.dart';
import 'package:marketplace/products/data/models/products_model.dart';
import 'package:marketplace/products/presentation/widgets/product_list_widget.dart';
import 'package:marketplace/service_locator.dart';
import 'package:marketplace/shared/extensions/context_extensions.dart';
import 'package:marketplace/shared/widgets/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HorizontalCategoriesWidget(),
        const GapH(22),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              Text(
                "Our Best Product",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ),
        const GapH(10),
        Expanded(
          child: ProductListWidget(
            bloc: context.read<ProductsBloc>(),
          ),
        )
      ],
    );
  }
}
