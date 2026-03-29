import 'package:cricrush/module/bottom/bottom.dart';
import 'package:cricrush/module/bottom/exit_page.dart';
import 'package:cricrush/module/home/page/home.dart';
import 'package:cricrush/module/home/page/sub_page/sorts.dart';
import 'package:cricrush/module/intro/intro_page.dart';
import 'package:cricrush/module/intro/widget/get_start.dart';
import 'package:cricrush/module/setting/page/notification.dart';
import 'package:cricrush/module/setting/page/p_ranking/all_rounder_mr.dart';
import 'package:cricrush/module/setting/page/p_ranking/all_rounder_wr.dart';
import 'package:cricrush/module/setting/page/p_ranking/batting_mr.dart';
import 'package:cricrush/module/setting/page/p_ranking/batting_wr.dart';
import 'package:cricrush/module/setting/page/p_ranking/bowling_mr.dart';
import 'package:cricrush/module/setting/page/p_ranking/bowling_wr.dart';
import 'package:cricrush/module/setting/page/p_ranking/rankings.dart';
import 'package:cricrush/module/setting/page/privacy_policy.dart';
import 'package:cricrush/module/setting/page/t_ranking/team_mr.dart';
import 'package:cricrush/module/setting/page/t_ranking/team_wr.dart';
import 'package:cricrush/module/splash_page.dart';
import 'package:cricrush/module/tours/page/sub_page/news_details.dart';
import 'package:cricrush/module/tours/page/sub_page/player_state.dart';
import 'package:cricrush/module/tours/page/sub_page/team_squad.dart';
import 'package:get/get.dart';

import '../module/match_details/page/match_details.dart';
import '../module/setting/page/t_ranking/ranking.dart';

mixin Routes {
  static const Transition defaultTransition = Transition.native;

  static const String bottomPage = "/bottomPage";
  static const String homePage = "/homePage";
  static const String playerState = "/playerState";
  static const String teamSquad = "/teamSquad";
  static const String sortsPage = "/sortsPage";
  static const String newsDetails = "/newsDetails";
  static const String matchDetails = "/matchDetails";
  static const String playerRanking = "/playerRanking";
  static const String teamRanking = "/teamRanking";
  static const String battingMR = "/battingMR";
  static const String bowlingMR = "/bowlingMR";
  static const String allRounderMr = "/allRounderMr";
  static const String teamMR = "/teamMR";
  static const String teamWr = "/teamWr";
  static const String battingWr = "/battingWr";
  static const String bowlingWr = "/bowlingWr";
  static const String allRounderWr = "/allRounderWr";
  static const String notificationS = "/notificationS";
  static const String privacyPolicy = "/privacyPolicy";
  static const String introPage = "/introPage";
  static const String splashPage = "/splashPage";
  static const String getStarted = "/getStarted";
  static const String exitPage = "/exitPage";

  static List<GetPage<dynamic>> routes = [
    GetPage(name: bottomPage, page: () => const BottomPage(), transition: defaultTransition),
    GetPage(name: homePage, page: () => const HomePage(), transition: defaultTransition),
    GetPage(name: playerState, page: () => PlayerState(), transition: defaultTransition),
    GetPage(name: teamSquad, page: () => TeamSquad(), transition: defaultTransition),
    GetPage(name: sortsPage, page: () => SortsPage(), transition: defaultTransition),
    GetPage(name: newsDetails, page: () => NewsDetails(), transition: defaultTransition),
    GetPage(name: matchDetails, page: () => MatchDetails(), transition: defaultTransition),
    GetPage(name: playerRanking, page: () => PlayerRanking(), transition: defaultTransition),
    GetPage(name: teamRanking, page: () => TeamRanking(), transition: defaultTransition),
    GetPage(name: battingMR, page: () => BattingMR(), transition: defaultTransition),
    GetPage(name: bowlingMR, page: () => BowlingMR(), transition: defaultTransition),
    GetPage(name: allRounderMr, page: () => AllRounderMr(), transition: defaultTransition),
    GetPage(name: teamMR, page: () => TeamMR(), transition: defaultTransition),
    GetPage(name: teamWr, page: () => TeamWr(), transition: defaultTransition),
    GetPage(name: battingWr, page: () => BattingWr(), transition: defaultTransition),
    GetPage(name: bowlingWr, page: () => BowlingWr(), transition: defaultTransition),
    GetPage(name: allRounderWr, page: () => AllRounderWr(), transition: defaultTransition),
    GetPage(name: notificationS, page: () => NotificationS(), transition: defaultTransition),
    GetPage(name: privacyPolicy, page: () => PrivacyPolicy(), transition: defaultTransition),
    GetPage(name: introPage, page: () => IntroPage(), transition: defaultTransition),
    GetPage(name: splashPage, page: () => SplashPage(), transition: defaultTransition),
    GetPage(name: getStarted, page: () => GetStarted(), transition: defaultTransition),
    GetPage(name: exitPage, page: () => ExitPage(), transition: defaultTransition),
  ];
}
