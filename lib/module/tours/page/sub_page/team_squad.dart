import 'package:cricrush/module/tours/model/tours_details_model.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/custom_appbar.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:cricrush/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamSquad extends StatelessWidget {
  const TeamSquad({super.key});

  @override
  Widget build(BuildContext context) {
    final TourTeams tourTeams = Get.arguments;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: CustomAppBar(
        backgroundColor: AppColor.card,
        isBackAppbar: true,
        title: Text(
          "${tourTeams.nameFull}",
          style: tDmSans(context, fontWeight: FontWeight.w600, fontSize: context.sp(17)),
        ),
      ),
      body: tourTeams.players == null || (tourTeams.players?.isEmpty ?? true)
          ? const ED(text: "Matches Not Found")
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: tourTeams.players?.length ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.wp(3),
                      vertical: context.hp(1.2),
                    ),
                    itemBuilder: (context, index) {
                      final data = tourTeams.players?[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColor.card,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.wp(2),
                            vertical: context.hp(1),
                          ),
                          child: Row(
                            children: [
                              showPlayer(
                                context: context,
                                url: data?.image ?? '',
                                w: context.wp(3),
                                h: context.wp(3),
                              ),
                              SizedBox(width: context.wp(4)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data?.name}",
                                    overflow: TextOverflow.ellipsis,
                                    style: tBarlow(context),
                                  ),
                                  SizedBox(height: context.hp(0.3)),
                                  Text(
                                    data?.skillName ?? "",
                                    style: stDmSans(context, fontSize: context.sp(12)),
                                  ),

                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    data?.sportSpecificKeys?.battingStyle ?? "",
                                    style: stDmSans(context, fontSize: context.sp(12)),
                                  ),
                                  SizedBox(height: context.hp(0.3)),
                                  Text(
                                    data?.sportSpecificKeys?.bowlingStyle ?? "",
                                    style: stDmSans(context, fontSize: context.sp(12)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: context.hp(1.2));
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
