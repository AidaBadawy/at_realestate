import 'package:aisu_realestate/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:aisu_realestate/app/app.bottomsheets.dart';
import 'package:aisu_realestate/app/app.dialogs.dart';
import 'package:aisu_realestate/app/app.locator.dart';
import 'package:aisu_realestate/app/app.router.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';
export 'package:aisu_realestate/app/app_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  BuildEnvironment.init(
      flavor: BuildFlavor.development,
      appName: 'Aisu Real Estate',
      baseUrl: 'http://127.0.0.1:8090/');
  assert(env != null);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      );
    });
  }
}
