import 'package:get/get_navigation/get_navigation.dart';
import 'package:raft_labs_task/bindings/app_bindings.dart';
import 'package:raft_labs_task/routes/routes.dart';
import 'package:raft_labs_task/views/mainpage_view.dart';
import 'package:raft_labs_task/views/splash_view.dart';

import 'constants/imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: Routes.routes,
    );
  }
}
