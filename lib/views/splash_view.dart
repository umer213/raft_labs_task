import 'package:raft_labs_task/widgets/app_text.dart';

import '../constants/imports.dart';

class SplashView extends GetWidget<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Center(
        child: AppRichText(
            text1: "Hey",
            color1: Colors.purple,
            text2: "RaftLabs",
            color2: Colors.teal),
      ),
    );
  }
}
