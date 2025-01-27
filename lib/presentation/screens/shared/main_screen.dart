import 'package:flutter/material.dart';
import 'package:peaje_app/presentation/widgets/custom_navbar.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.selectedIndex,
    required this.child,
  });

  final int selectedIndex;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavigationProvider>();
    return Scaffold(
      body: child,
      bottomNavigationBar:navProvider.showNavBar? CustomNavbar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          navProvider.updateIndex(index);
        },
      ) : null
    );
  }
  }

