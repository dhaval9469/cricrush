import 'package:cricrush/module/bottom/bottom.dart';
import 'package:cricrush/module/home/page/home.dart';
import 'package:cricrush/module/home/page/sub_page/sorts.dart';
import 'package:cricrush/module/setting/page/ranking/all_rounder_mr.dart';
import 'package:cricrush/module/setting/page/ranking/batting_mr.dart';
import 'package:cricrush/module/setting/page/ranking/bowling_mr.dart';
import 'package:cricrush/module/setting/page/ranking/rankings.dart';
import 'package:cricrush/module/setting/page/ranking/team_mr.dart';
import 'package:cricrush/module/tours/page/sub_page/news_details.dart';
import 'package:cricrush/module/tours/page/sub_page/player_state.dart';
import 'package:cricrush/module/tours/page/sub_page/team_squad.dart';
import 'package:get/get.dart';

import '../module/match_details/page/match_details.dart';

mixin Routes {
  static const Transition defaultTransition = Transition.native;

  static const String bottomPage = "/bottomPage";
  static const String homePage = "/homePage";
  static const String playerState = "/playerState";
  static const String teamSquad = "/teamSquad";
  static const String sortsPage = "/sortsPage";
  static const String newsDetails = "/newsDetails";
  static const String matchDetails = "/matchDetails";
  static const String rankings = "/rankings";
  static const String battingMR = "/battingMR";
  static const String bowlingMR = "/bowlingMR";
  static const String allRounderMr = "/allRounderMr";
  static const String teamMR = "/teamMR";

  static List<GetPage<dynamic>> routes = [
    GetPage(name: bottomPage, page: () => const BottomPage(), transition: defaultTransition),
    GetPage(name: homePage, page: () => const HomePage(), transition: defaultTransition),
    GetPage(name: playerState, page: () => PlayerState(), transition: defaultTransition),
    GetPage(name: teamSquad, page: () => TeamSquad(), transition: defaultTransition),
    GetPage(name: sortsPage, page: () => SortsPage(), transition: defaultTransition),
    GetPage(name: newsDetails, page: () => NewsDetails(), transition: defaultTransition),
    GetPage(name: matchDetails, page: () => MatchDetails(), transition: defaultTransition),
    GetPage(name: rankings, page: () => Rankings(), transition: defaultTransition),
    GetPage(name: battingMR, page: () => BattingMR(), transition: defaultTransition),
    GetPage(name: bowlingMR, page: () => BowlingMR(), transition: defaultTransition),
    GetPage(name: allRounderMr, page: () => AllRounderMr(), transition: defaultTransition),
    GetPage(name: teamMR, page: () => TeamMR(), transition: defaultTransition),
  ];
}
