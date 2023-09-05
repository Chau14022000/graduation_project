import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'injection/dependencies.dart';
import 'presentation/resources/app_theme.dart';
import 'presentation/routes/app_router.gr.dart';
import 'utilities/helpers/app_helper/app_flavor_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(AppFlavor.development);
}

Future<void> mainCommon(AppFlavor flavor) async {
  await Firebase.initializeApp();
  await DependencyManager.inject(AppFlavor.development);
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _autoRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _autoRouter.delegate(),
      routeInformationParser: _autoRouter.defaultRouteParser(),
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
    );
  }
}


