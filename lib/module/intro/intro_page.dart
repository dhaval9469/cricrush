import 'package:cricrush/helper/local_storage_service.dart';
import 'package:cricrush/module/intro/widget/f_intro.dart';
import 'package:cricrush/module/intro/widget/s_intro.dart';
import 'package:cricrush/module/intro/widget/t_intro.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/app_config.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onNextTap() {
    if (currentPage < 2) {
      pageController.animateToPage(currentPage + 1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      AppPref().write(AppConfig.intro, true);
      Navigation.pushNamed(Routes.bottomPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: AppColor.background, toolbarHeight: 0),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [SIntro(), TIntro(), FIntro()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(10)),
              child: GestureDetector(
                onTap: onNextTap,
                child: Container(
                  decoration: BoxDecoration(color: AppColor.button, borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: context.hp(1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: tDmSans(context, fontSize: context.sp(18), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(color: AppColor.background, height: 110, width: double.infinity),
      ),
    );
  }
}
