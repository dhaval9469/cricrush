import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/navigation.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/utils/routing.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TSquad extends StatelessWidget {
  TSquad({super.key});

  final tourCtrl = Get.find<ToursCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(
        () => tourCtrl.tDL.value
            ? Center(child: const DL())
            : tourCtrl.tTeamsList.isEmpty
            ? Center(child: const ED(text: "Squad not available"))
            : ListView.separated(
                shrinkWrap: true,
                itemCount: tourCtrl.tTeamsList.length,
          padding: EdgeInsets.only(top: context.hp(1),bottom: context.hp(3)),
                itemBuilder: (context, index) {
                  final data = tourCtrl.tTeamsList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigation.pushNamed(Routes.teamSquad, arg: data);
                    },
                    child: Container(
                      decoration: BoxDecoration(color: AppColor.card),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.wp(3),
                          vertical: context.hp(1),
                        ),
                        child: Row(
                          children: [
                            showFlag(
                              context: context,
                              url: data.image ?? '',
                              w: context.wp(1.7),
                              h: context.wp(1.7),
                            ),
                            SizedBox(width: context.wp(2.5)),
                            Text(
                              "${data.nameFull}",
                              style: tBarlow(context, fontWeight: FontWeight.w600),
                              strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: AppColor.subText,
                              size: context.sp(16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: context.hp(0.7));
                },
              ),
      ),
    );
  }
}
