import 'package:get/get.dart';

import '../constants/imports.dart';

class MainPage extends GetWidget<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List screens = [
      FetchApi(),
      Greeting(),
      webView(),
    ];

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Raft LABS",
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: myBottomBar(),
        body: Obx((() => screens[controller.currentScreen.value])));
  }

  Widget myBottomBar() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(25)),
      child: BottomNavigationBar(
          currentIndex: controller.currentScreen.value,
          onTap: ((value) {
            controller.changeScreen(value);
          }),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          items: [
            _navigationItem(Icon(Icons.home), "Fetch"),
            _navigationItem(Icon(Icons.gesture_outlined), "greeting"),
            _navigationItem(Icon(Icons.web), "web"),
          ]),
    );
  }

  Widget FetchApi() {
    return Container(
        child: Obx(() => controller.looding == true
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.entry.length,
                itemBuilder: (context, index) {
                  var entry = controller.entry[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Color.fromARGB(60, 220, 217, 217),
                    padding: EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _card(entry != null
                              ? AppNormalText(text: entry.hTTPS.toString())
                              : Text("No Data")),
                          _card(entry != null
                              ? AppNormalText(text: entry.description!)
                              : Text("No Data")),
                          _card(entry != null
                              ? AppLargeText(text: entry.aPI.toString())
                              : Text("No Data")),
                          _card(entry != null
                              ? AppNormalText(
                                  text:
                                      "${entry.auth.toString()}${"not availible"}")
                              : Text("No Data")),
                          _card(entry != null
                              ? AppLargeText(text: entry.category.toString())
                              : Text("No Data")),
                          _card(entry != null
                              ? AppLargeText(text: entry.cors.toString())
                              : Text("No Data")),
                          _card(entry != null
                              ? AppNormalText(
                                  text: entry.link.toString(),
                                  color: Colors.blue,
                                )
                              : Text("No Data")),
                        ]),
                  );
                })));
  }

  Widget Greeting() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Obx((() => controller.isConnected2 != false
          ? Column(children: [
              AppLargeText(text: controller.greeting.value),
              AppNormalText(text: controller.isConnected.value),
            ])
          : Text(controller.isConnected.value))),
    );
  }

  Widget webView() {
    return Container(
      child: WebView(
        //i have used my own github repo for example
        initialUrl: 'https://github.com/umer213/raft_labs_task',
        onWebViewCreated: (controller) {
          controller = controller;
        },
      ),
    );
  }
}

_navigationItem(final Icon icon, final String label) {
  return BottomNavigationBarItem(icon: icon, label: label);
}

_card(final Widget text) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
    ),
    child: (Card(
      margin: EdgeInsets.all(5),
      elevation: 3,
      //color: Colors.purple,
      shadowColor: Colors.grey.shade100,
      child: text,
    )),
  );
}
