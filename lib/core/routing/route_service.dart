import 'package:get/get.dart';
import 'package:flutter_portfolio/app/home/presentation/home_view.dart';

class RouteService {
  static const homePage = '/';

  static final List<GetPage> pages = [
    GetPage(
      name: homePage,
      page: () => const HomeView(),
    ),
  ];
}
