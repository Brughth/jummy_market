import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:marketplace/app_init_screen.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';
import 'package:marketplace/cart/business_logic/cubit/cart_cubit.dart';
import 'package:marketplace/category/business_logic/bloc/category_list_bloc.dart';
import 'package:marketplace/products/business_logic/bloc/products_bloc.dart';
import 'package:marketplace/service_locator.dart';
import 'package:marketplace/shared/theme/light_theme.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  //'emilys'
  //'emilyspass'

  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<AuthBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<CategoryListBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<ProductsBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<CartCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Marketplace',
          themeMode: ThemeMode.light,
          theme: buildLightTheme(),
          darkTheme: buildLightTheme(),
          home: const AppInitScreen(),
        ),
      ),
    );
  }
}
