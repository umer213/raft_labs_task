import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:raft_labs_task/bindings/app_bindings.dart';
import 'package:raft_labs_task/views/mainpage_view.dart';

import '../views/splash_view.dart';

class Routes {
  static String splash = "/";
  static String mainPage = "/main";

  static String splashView() => splash;

  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => SplashView(),
      binding: MyBindings(),
    ),
    GetPage(
      name: '/login',
      page: () => MainPage(),
      binding: MyBindings(),
    ),
  ];
}
