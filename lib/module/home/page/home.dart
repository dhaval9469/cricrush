import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/module/home/widget/must_watch.dart';
import 'package:cricrush/module/home/widget/recent_match.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [RecentMatch(),

          MustWatch(),

        ]),
      ),
    );
  }
}
