
import 'package:peaje_app/presentation/providers/session_provider.dart';

import '../../presentation/providers/navigation_provider.dart';
import '/common/common_index.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//Inicializacion de los providers utilizados en la aplicacion
class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => GeneralProvider()),
    ChangeNotifierProvider(create: (_) => PaginationProvider()),
    ChangeNotifierProvider(create: (_) => SessionProvider()),
    ChangeNotifierProvider(create: (_) => NavigationProvider()),
  ];

  static List<GeneralProvider> getDisposableProviders(BuildContext context) {
    return [
      context.read<GeneralProvider>(),
    ];
  }

  static void disposeAllProviders(BuildContext context) {
    getDisposableProviders(context).forEach((disposableProvider) {
      disposableProvider
        ..disposeValues()
        ..resetValues();
    });
  }
}