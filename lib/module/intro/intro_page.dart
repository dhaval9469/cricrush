import 'package:cricrush/module/intro/widget/f_intro.dart';
import 'package:cricrush/module/intro/widget/s_intro.dart';
import 'package:cricrush/module/intro/widget/t_intro.dart';
import 'package:cricrush/res/app_color.dart';
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
            children: [FIntro(), SIntro(), TIntro()],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(color: AppColor.subCard, height: 110, width: double.infinity),
      ),
    );
  }
}
