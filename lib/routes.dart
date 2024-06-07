
import 'package:analysis_app/GetDetail.dart';
import 'package:analysis_app/GetResults.dart';
import 'package:analysis_app/HomeScreen.dart';
import 'package:analysis_app/SendCsv.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';



appRoutes() => [
  GetPage(
    name: "/home",
    page: () => const HomeScreen(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: "/sendCsv",
    page: () =>  SendCsv(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: "/results",
    page: () =>  GraphListScreen(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: "/detail",
    page: () =>  GetDetail(),
    middlewares: [RouteMiddleware()],
    transitionDuration: const Duration(milliseconds: 500),
  ),
];

class RouteMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
