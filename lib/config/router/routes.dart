import 'package:flutter/material.dart';
import 'package:peaje_app/presentation/screens/screen_index.dart';

import '../data_constants/data_constants.dart';


class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    DataConstants.firstLoginScreen: (_) => const FirstLoginScreen(),
    DataConstants.registerScreen: (_) => const RegisterScreen(),
    DataConstants.paymentScreen: (_) => const PaymentScreen(),
    DataConstants.homeScreen: (_) => const MainScreen(selectedIndex: 0, child: HomeScreen()),
    DataConstants.webViewScreen: (_) => const PaymentWebView(),
    DataConstants.vehiclesScreen: (_) =>const MainScreen(selectedIndex: 1,  child: VehiclesScreen()),
    // DataConstant.profileScreen: (_) =>
    //     const MainScreen(selectedIndex: 2, child: ProfileScreen()),
    // DataConstant.homeScreen: (_) => const MainScreen(selectedIndex: 0, child: HomeScreen()),

  };
}
