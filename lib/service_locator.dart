import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';
import 'package:marketplace/auth/data/repositories/auth_repository.dart';
import 'package:marketplace/auth/data/services.dart/auth_service.dart';
import 'package:marketplace/cart/business_logic/cubit/cart_cubit.dart';
import 'package:marketplace/category/business_logic/bloc/category_list_bloc.dart';
import 'package:marketplace/category/data/category_repository.dart';
import 'package:marketplace/category/data/category_service.dart';
import 'package:marketplace/products/business_logic/bloc/products_bloc.dart';
import 'package:marketplace/products/data/models/product_query_filter.dart';
import 'package:marketplace/products/data/repositories/product_repository.dart';
import 'package:marketplace/products/data/service/product_service.dart';
import 'package:marketplace/shared/token_interceptor.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
    ),
  )..interceptors.add(TokenInterceptor()));

  getIt.registerSingleton(AuthService(http: getIt.get<Dio>()));
  getIt.registerSingleton(AuthRepository(service: getIt.get<AuthService>()));
  getIt.registerSingleton(AuthBloc(repository: getIt.get<AuthRepository>()));

  getIt.registerSingleton(CategoryService(http: getIt.get<Dio>()));
  getIt.registerSingleton(
      CategoryRepository(service: getIt.get<CategoryService>()));
  getIt.registerSingleton(
      CategoryListBloc(repository: getIt.get<CategoryRepository>()));

  getIt.registerSingleton(ProductService(http: getIt.get<Dio>()));
  getIt.registerSingleton(
      ProductRepository(service: getIt.get<ProductService>()));
  getIt.registerSingleton(
    ProductsBloc(
      repository: getIt.get<ProductRepository>(),
      filter: ProductQueryFilter(
        limit: 30,
      ),
    ),
  );

  getIt.registerSingleton<CartCubit>(CartCubit());
}
