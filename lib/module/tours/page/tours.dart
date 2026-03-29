import 'package:cricrush/ad_module/banner/banner_ad.dart';
import 'package:cricrush/ad_module/interstitial_ad.dart';
import 'package:cricrush/module/tours/ctrl/tours_ctrl.dart';
import 'package:cricrush/module/tours/page/t_keystate.dart';
import 'package:cricrush/module/tours/page/t_matches.dart';
import 'package:cricrush/module/tours/page/t_news.dart';
import 'package:cricrush/module/tours/page/t_overview.dart';
import 'package:cricrush/module/tours/page/t_point_table.dart';
import 'package:cricrush/module/tours/page/t_squad.dart';
import 'package:cricrush/module/tours/service/tour_ws_service.dart';
import 'package:cricrush/res/app_color.dart';
import 'package:cricrush/res/textstyle.dart';
import 'package:cricrush/utils/analytics_service.dart';
import 'package:cricrush/utils/responsive.dart';
import 'package:cricrush/widget/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToursPage extends StatefulWidget {
  const ToursPage({super.key});

  @override
  State<ToursPage> createState() => _ToursPageState();
}

class _ToursPageState extends State<ToursPage> with SingleTickerProviderStateMixin {
  final tourWsService = Get.find<TourWSService>();
  final tourCtrl = Get.find<ToursCtrl>();

  @override
  void initState() {
    tourCtrl.tabController = TabController(vsync: this, length: 6);
    tourCtrl.tabController?.addListener(() {
      if (!tourCtrl.tabController!.indexIsChanging) {
        Interstitial.showInterstitialByCount();
      }
    });
    super.initState();
    AnalyticsService().logScreen('TourScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        toolbarHeight: context.hp(13),
        title: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.hp(0.7)),
              SizedBox(
                height: context.hp(8),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: tourCtrl.seriesList.length,
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final data = tourCtrl.seriesList[index];
                    return GestureDetector(
                      onTap: () async {
                        AnalyticsService().logEvent(name: 'change_series_click', parameters: {'TourScreen': '${data.sortTitle}'});
                        Interstitial.showInterstitialByCount();
                        tourCtrl.csl.value = true;
                        tourWsService.changeTour(newTourId: data.tourId ?? "", newSeriesId: data.seriesId ?? "");
                        tourCtrl.getAllTD(tourId: data.tourId, seriesId: data.seriesId);
                        tourCtrl.tourId.value = data.tourId ?? "";
                        tourCtrl.seriesId.value = data.seriesId ?? "";
                        tourCtrl.tHeader.value = data.title ?? "";
                        tourCtrl.tDes.value = data.description ?? "";
                        tourCtrl.tFooter.value = data.sortTitle ?? "";
                        tourCtrl.tIndex.value = index;
                        tourCtrl.csl.value = false;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: context.wp(20),
                        height: context.hp(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: tourCtrl.tIndex.value == index ? AppColor.sTabColor : AppColor.cDivider,
                            width: tourCtrl.tIndex.value == index ? 2 : 1,
                          ),
                          boxShadow: tourCtrl.tIndex.value == index
                              ? [
                                  BoxShadow(
                                    color: AppColor.sTabColor.withValues(alpha: 0.9),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 0),
                                  ),
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                        ),
                        child: showFlag(
                          context: context,
                          url: 'https://media.crictracker.com/media/attachments/1773729386350_CT---IPL-1-(1).jpeg',
                          w: context.wp(20),
                          h: context.hp(8),
                          borderRadius: 10,
                        ),
                      ),
                      /*                     child: Container(
                        width: context.wp(20),
                        height: context.hp(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: tourCtrl.tIndex.value == index ? AppColor.sTabColor : AppColor.cDivider,
                            width: tourCtrl.tIndex.value == index ? 2 : 1,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://media.crictracker.com/media/attachments/1773729386350_CT---IPL-1-(1).jpeg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),*/
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: context.wp(2));
                  },
                ),
              ),
              SizedBox(height: context.hp(0.3)),
              Padding(
                padding: EdgeInsets.only(left: context.wp(4)),
                child: Text(tourCtrl.tHeader.value, style: tBarlow(context, fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: context.hp(0.3)),
              Padding(
                padding: EdgeInsets.only(left: context.wp(4)),
                child: Text(tourCtrl.tDes.value, style: stBarlow(context, fontSize: context.sp(12))),
              ),
            ],
          ),
        ),
        backgroundColor: AppColor.appbarBg,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(context.hp(5)),
          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            controller: tourCtrl.tabController,
            labelStyle: tabLabelTextStyle(context),
            unselectedLabelStyle: tabUnLabelTextStyle(context),
            indicatorSize: TabBarIndicatorSize.label,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.symmetric(horizontal: context.wp(1)),
            indicatorColor: AppColor.sTabColor,
            dividerColor: AppColor.tDivider,
            tabs: [
              Tab(
                height: context.hp(4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Text("Overview"),
                ),
              ),
              Tab(
                height: context.hp(4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Text("Matches"),
                ),
              ),
              Tab(
                height: context.hp(4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Text("Key State"),
                ),
              ),
              Tab(
                height: context.hp(4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Text("Squad"),
                ),
              ),
              Tab(
                height: context.hp(4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Text("Point Table"),
                ),
              ),
              Tab(
                height: context.hp(4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Text("News"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tourCtrl.tabController,
        children: [TOverview(), TMatches(), TKeyState(), TSquad(), TPointTable(), TNews()],
      ),
      bottomNavigationBar: BannerAds(),
    );
  }
}
