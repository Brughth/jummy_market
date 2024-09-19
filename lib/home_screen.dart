import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/category/business_logic/bloc/category_list_bloc.dart';
import 'package:marketplace/counter/presentation/counter_screen.dart';
import 'package:marketplace/shared/extensions/context_extensions.dart';
import 'package:marketplace/shared/extensions/string_extension.dart';
import 'package:marketplace/shared/shimmer_container.dart';
import 'package:marketplace/shared/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<CategoryListBloc, CategoryListState>(
          builder: (context, state) {
            if (state is FetchCategoryListLoading) {
              return Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(5),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(6, (e) {
                    return ShimmerContainer(
                      child: Container(
                        width: 80.w,
                        height: double.infinity,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }
            if (state.categories?.isNotEmpty ?? false) {
              return Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: (state.categories ?? []).length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        state.categories![index].capitalize(),
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    );
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
