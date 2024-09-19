import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/application_screen.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';
import 'package:marketplace/auth/presentation/pages/login_screen.dart';
import 'package:marketplace/category/business_logic/bloc/category_list_bloc.dart';
import 'package:marketplace/onboarding/onboarding_screen.dart';
import 'package:marketplace/products/business_logic/bloc/products_bloc.dart';
import 'package:marketplace/service_locator.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(CheckAuthStateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is FistTimeLaunch) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
            (router) => false,
          );
        }

        if (state is CheckAuthStateSuccess) {
          getIt.get<ProductsBloc>().add(GetProductsEvent());
          getIt.get<CategoryListBloc>().add(FetchCategoryListEvent());
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const ApplicationScreen()),
            (router) => false,
          );
        }

        if (state is CheckAuthStateFailure) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (router) => false,
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(
            radius: 40,
          ),
        ),
      ),
    );
  }
}
