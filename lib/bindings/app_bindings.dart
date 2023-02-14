import 'package:get/get.dart';
import 'package:raft_labs_task/constants/imports.dart';
import 'package:raft_labs_task/controllers/main_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => MainController(), fenix: true);
  }
}
