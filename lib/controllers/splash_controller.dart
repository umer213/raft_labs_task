import 'package:get/get.dart';

import '../constants/imports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () {
      Get.to(MainPage());
    });
  }
}
