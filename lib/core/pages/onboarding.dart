

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/assets/images.dart';
import 'package:productive/core/extensions/extensions.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  int thisPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.onBoardingColor,
        body: PageView(
          onPageChanged: (value) {
            thisPage = value;
          },
          controller: controller,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 24,
                          right: 24),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushNamed("/login");
                        },
                        child: Text(
                          "SKIP",
                          style: TextStyle(
                            fontSize: 20,
                            color: context.colors.onBordingSkip,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(83),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Image.asset(AppImages.onboardingFirstImage)),
                const Gap(40),
                Center(
                  child: Text(
                    "Easy Time Management",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: context.colors.white,
                    ),
                  ),
                ),
                const Gap(6),
                Center(
                  child: Text(
                    "We help you stay organized and\n manage your day",
                    style: TextStyle(
                        fontSize: 18, color: context.colors.onBoardTextColor),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 24,
                          right: 24),
                      child: GestureDetector(
                        onTap: () {
                
                        },
                        child: Text(
                          "SKIP",
                          style: TextStyle(
                            fontSize: 20,
                            color: context.colors.onBordingSkip,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(83),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.asset(AppImages.onboardingSecondImage),
                ),
                const Gap(40),
                Center(
                  child: Text(
                    "Track Your Expense",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: context.colors.white,
                    ),
                  ),
                ),
                const Gap(6),
                Center(
                  child: Text(
                    "We help you organize your expenses\n easily and safely",
                    style: TextStyle(
                        fontSize: 18, color: context.colors.onBoardTextColor),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            thisPage == 1
                ? GestureDetector(
                    onTap: () {
                      controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom + 24,
                          left: 24),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: context.colors.onBordingComponet,
                      ),
                      child: SvgPicture.asset(AppIcons.left),
                    ),
                  )
                : const SizedBox(
                    height: 44,
                    width: 66,
                  ),
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 8,
              width: thisPage == 0 ? 24 : 8,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 30, right: 4),
              decoration: BoxDecoration(
                color: thisPage == 0
                    ? context.colors.onBordingComponet
                    :context.colors. onBoarding,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 8,
              width: thisPage == 1 ? 24 : 8,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 30,
              ),
              decoration: BoxDecoration(
                color: thisPage == 1
                    ? context.colors.onBordingComponet
                    :context.colors. onBoarding,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (thisPage == 0) {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                } else {
                  // Navigator.of(context).pushNamed("/login");
                }
              },
              child: Container(
                height: 44,
                width: 44,
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 24,
                    right: 24),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:context.colors.onBordingComponet
               ,
                ),
                child: SvgPicture.asset(AppIcons.right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
