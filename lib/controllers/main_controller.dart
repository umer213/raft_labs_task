import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:raft_labs_task/constants/imports.dart';
import 'package:raft_labs_task/models/entry_model.dart';
import 'package:raft_labs_task/networking/api_repo.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  ApiRepo apiRepo = ApiRepo();
  MyModel model = MyModel();
  List<Entries> entry = [];
  final looding = true.obs;

  var currentScreen = 0.obs;

  changeScreen(int index) {
    currentScreen.value = index;
  }

  DateTime now = DateTime.now();
  var greeting = "".obs;

  greetings() {
    int hours = now.hour;

    if (hours >= 1 && hours <= 12) {
      greeting.value = "Good Morning";
    } else if (hours >= 12 && hours <= 16) {
      greeting.value = "Good Afternoon";
    } else if (hours >= 16 && hours <= 21) {
      greeting.value = "Good Evening";
    } else if (hours >= 21 && hours <= 24) {
      greeting.value = "Good Night";
    }
  }

  Future userData() async {
    final response = await apiRepo.FetchData();
    if (response.statusCode == 200) {
      model = MyModel.fromJson(response.data);
      entry = model.entries!;
      looding.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userData();
    greetings();
    checkInternet();
  }

  var isConnected = "".obs;
  var isConnected2 = false.obs;

  void checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnected.value = "Conneted to Mobile";
      isConnected2.value = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConnected2.value = true;
      isConnected.value = "Conneted to Mobile";
    } else {
      connectivityResult == ConnectivityResult.none;
      isConnected2.value = true;
      isConnected.value = "Offline";
    }
  }
}
//url_launcher: ^6.1.9
