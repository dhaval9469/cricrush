import 'package:cricrush/module/bottom/bottom.dart';
import 'package:cricrush/module/home/page/home.dart';
import 'package:get/get.dart';

mixin Routes {
  static const Transition defaultTransition = Transition.native;

  static const String bottomPage = "/bottomPage";
  static const String homePage = "/homePage";

  static List<GetPage<dynamic>> routes = [
    GetPage(name: bottomPage, page: () => const BottomPage(), transition: defaultTransition),
    GetPage(name: homePage, page: () => const HomePage(), transition: defaultTransition),
  ];
}
