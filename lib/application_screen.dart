import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return const CounterScreen();
    return Scaffold(
      body: Center(
          child: Text(
        "${context.read<AuthBloc>().state.user?.firstName}",
      )),
    );
  }
}
