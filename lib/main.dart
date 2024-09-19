import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/app_init_screen.dart';
import 'package:marketplace/application_screen.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';
import 'package:marketplace/auth/data/repositories/auth_repository.dart';
import 'package:marketplace/auth/data/services.dart/auth_service.dart';
import 'package:marketplace/onboarding/onboarding_screen.dart';
import 'package:marketplace/shared/theme/light_theme.dart';
import 'package:marketplace/shared/token_interceptor.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

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
      child: BlocProvider(
        create: (context) => AuthBloc(
          repository: AuthRepository(
              service: AuthService(
            http: Dio(
              BaseOptions(
                baseUrl: 'https://dummyjson.com',
              ),
            )..interceptors.add(TokenInterceptor()),
          )),
        ),
        child: MaterialApp(
          title: 'Marketplace',
          themeMode: ThemeMode.light,
          theme: buildLightTheme(),
          darkTheme: buildLightTheme(),
          home: const ApplicationScreen(),
        ),
      ),
    );
  }
}
