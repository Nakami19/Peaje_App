import '/common/common_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'common/providers/app_providers.dart';
import 'config/router/app_router.dart';
// import 'flavors.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        initialRoute: '/firstLogin',
        onGenerateInitialRoutes: (initialRoute) =>
            [AppRouter.generateRoute(RouteSettings(name: initialRoute))],
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        // title: FlavorConfig.flavorValues.environmentName,
        theme: AppTheme.themeLight(),
        supportedLocales: const [
          Locale('es'), // Español
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        darkTheme: AppTheme.themeDark(primaryColor),
        themeMode:
            themeProvider.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,

        // Esto permite que no se modifique el tamano de la app, aunque si se modifique el del dispositivo
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          );
          return MediaQuery(
            data: mediaQueryData,
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
