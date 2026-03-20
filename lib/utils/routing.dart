import 'package:cricrush/module/home/page/home.dart';
import 'package:get/get.dart';

mixin Routes {
  static const Transition defaultTransition = Transition.native;

  static const String homePage = "/homePage";

  static List<GetPage<dynamic>> routes = [GetPage(name: homePage, page: () => const HomePage(), transition: defaultTransition)];
}
