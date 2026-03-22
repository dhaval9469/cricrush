import 'package:cricrush/module/home/ctrl/home_ctrl.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MustWatch extends StatelessWidget {
  MustWatch({super.key});

  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.allNSSL.value
          ? CircularProgressIndicator()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.wp(5),
                    bottom: context.hp(1.5),
                    top: context.hp(2.5),
                  ),
                  child: Text(
                    "Must Watch",
                    style: stDmSans(context, color: AppColor.text, fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(
                  height: context.hp(25),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: context.wp(4)),
                    itemCount: homeCtrl.shortsList.length,
                    itemBuilder: (context, index) {
                      final data = homeCtrl.shortsList[index];
                      return data.adsShow == 1
                          ? SizedBox.shrink()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                data.image2 ?? "",
                                height: context.hp(25),
                                width: context.wp(40),
                                fit: BoxFit.fill,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return SizedBox(height: context.hp(25), width: context.wp(40));
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "",
                                    fit: BoxFit.cover,
                                    height: context.hp(25),
                                    width: context.wp(40),
                                  );
                                },
                              ),
                            );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: context.wp(3));
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
