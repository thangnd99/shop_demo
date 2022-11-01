import 'package:get/get.dart';
import 'package:shop_demo_app/ui/pages/detail_product/detail_product_page.dart';

import '../ui/pages/main/main_page.dart';
import '../ui/pages/splash/splash_page.dart';

class RouteConfig {
  RouteConfig._();

  ///main page
  static const String splash = "/splash";
  static const String main = "/main";
  static const String detailProduct = "/detailProduct";

  ///Alias ​​mapping page
  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: main, page: () => const MainPage()),
    GetPage(
      name: detailProduct,
      page: () => DetailProductPage(argument: Get.arguments),
    ),
  ];
}
