import 'package:flutter/material.dart';
import 'package:peaje_app/config/router/routes.dart';

import '../../common/common_index.dart';
import '../../presentation/screens/shared/main_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      default:
      // Busca en el mapa de rutas si existe un builder para la ruta solicitada
        final builder = AppRoutes.routes[settings.name];
        if (builder != null) {
          return FadePageTransition(builder: builder);
        }
        // Si la ruta no está definida, muestra vista de mantenimiento
        return FadePageTransition(
            builder: (_) => const Scaffold(
              body: Center(child: Text('Ruta no definida')),
            ));
    }
  }

  //Rutas con errores o argumentos faltantes
  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text(message)),
      ),
    );
  }
}