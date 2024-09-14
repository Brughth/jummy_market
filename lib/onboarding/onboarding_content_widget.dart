import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/auth/presentation/pages/login_screen.dart';

import 'package:marketplace/shared/extensions/context_extensions.dart';
import 'package:marketplace/shared/theme/app_colors.dart';
import 'package:marketplace/shared/widgets/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingContentWidget extends StatelessWidget {
  final String image;
  final String? title;
  final String description;

  const OnboardingContentWidget({
    super.key,
    required this.image,
    this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          image,
        ),
        const Spacer(flex: 2),
        if (title != null)
          Text(
            title!,
            style: context.textTheme.headlineSmall?.copyWith(
              fontSize: 22.sp,
            ),
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  /// ?????!!!!
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  prefs.setBool('is_first_time_launch', false);

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (router) => false,
                  );
                },
                child: Text(
                  'Sign In',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              const GapW(10),
              Container(
                width: 1,
                height: 15,
                color: AppColors.gray400,
              ),
              const GapW(10),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Sign Up',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                  ),
                ),
              )
            ],
          ),
        const GapH(20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.hintColor,
            fontSize: 17.sp,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
