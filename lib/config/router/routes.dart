import 'package:flutter/material.dart';
import 'package:peaje_app/presentation/screens/auth/register_screen.dart';
import 'package:peaje_app/presentation/screens/payment/payment_screen.dart';
import 'package:peaje_app/presentation/screens/shared/home_screen.dart';

import '../../presentation/screens/auth/first_login_screen.dart';
import '../data_constants/data_constants.dart';


class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    DataConstants.firstLoginScreen: (_) => const FirstLoginScreen(),
    DataConstants.registerScreen: (_) => const RegisterScreen(),
    DataConstants.paymentScreen: (_) => const PaymentScreen(),
    DataConstants.homeScreen: (_) => const HomeScreen(),
    // DataConstant.profileScreen: (_) =>
    //     const MainScreen(selectedIndex: 2, child: ProfileScreen()),
    // DataConstant.homeScreen: (_) => const MainScreen(selectedIndex: 0, child: HomeScreen()),

  };
}
