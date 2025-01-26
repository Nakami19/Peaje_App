import 'dart:async';
// import '/common/data/constants.dart';
// import '/common/data/enviroment.dart';
import '/common/providers/theme_provider.dart';
import 'package:flutter/material.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //se lee la informacion de .env
  // await Enviroment.initEnviroment();

  // se obtiene informacion de la app desde el pubspec
  // final appInfo = await PackageInfo.fromPlatform();
  // Constants.appVersion = appInfo.version;
  // Constants.buildNumber = appInfo.buildNumber;

  //se carga el modo oscuro
  final themeProvider = ThemeProvider();
  await themeProvider.loadDarkModeFromStorage();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(
      ChangeNotifierProvider<ThemeProvider>.value(
        value: themeProvider,
        child: const App(),
      ),
    );
  });
}