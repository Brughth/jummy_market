import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace/onboarding/onboarding_content_widget.dart';
import 'package:marketplace/shared/extensions/context_extensions.dart';
import 'package:marketplace/shared/theme/app_colors.dart';
import 'package:marketplace/shared/widgets/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.theme.appBarTheme.systemOverlayStyle!,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: const [
                  OnboardingContentWidget(
                    image: 'asserts/images/delivery.png',
                    title: 'Welcome to Future Market',
                    description:
                        'Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit',
                  ),
                  OnboardingContentWidget(
                    image: 'asserts/images/order_completed.png',
                    title: 'Lorconsectetur adipisicing',
                    description:
                        'Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit',
                  ),
                  OnboardingContentWidget(
                    image: 'asserts/images/uploading.png',
                    description:
                        'Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: 60,
                    height: 4,
                    color:
                        currentPage == 0 ? AppColors.black : AppColors.gray50,
                  ),
                ),
                const GapW(20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: 60,
                    height: 4,
                    color:
                        currentPage == 1 ? AppColors.black : AppColors.gray50,
                  ),
                ),
                const GapW(20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: 60,
                    height: 4,
                    color:
                        currentPage == 2 ? AppColors.black : AppColors.gray50,
                  ),
                )
              ],
            ),
            const GapH(10),
          ],
        ),
      ),
    );
  }
}
