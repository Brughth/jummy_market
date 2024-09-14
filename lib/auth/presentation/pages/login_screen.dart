import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:marketplace/application_screen.dart';
import 'package:marketplace/auth/business_logic/bloc/auth_bloc.dart';
import 'package:marketplace/shared/theme/app_colors.dart';
import 'package:marketplace/shared/widgets/app_button.dart';
import 'package:marketplace/shared/widgets/app_input.dart';
import 'package:marketplace/shared/widgets/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }

          if (state is LoginSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ApplicationScreen(),
              ),
              (router) => false,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const GapH(40),
                  AppInput(
                    controller: userNameController,
                    validators: [FormBuilderValidators.required()],
                    label: "User name",
                    hint: 'username',
                  ),
                  const GapH(20),
                  AppInput(
                    controller: passwordController,
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    label: "Password",
                    hint: 'password',
                    hideText: true,
                    obscureText: true,
                    showEyes: true,
                  ),
                  const GapH(40),
                  AppButton(
                    loading: state is LoginLoading,
                    bgColor: AppColors.primary,
                    text: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              LoginEvent(
                                username: userNameController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
