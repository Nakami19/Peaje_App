import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaje_app/config/data_constants/data_constants.dart';

import '../../common/common_index.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key, required this.selectedIndex,
    required this.onDestinationSelected,});


  final int selectedIndex; // Recibe el índice desde el provider
  final ValueChanged<int> onDestinationSelected;

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadiusValue),
          topRight: Radius.circular(borderRadiusValue),
        ),
        border: Border(
          top: BorderSide(
            color:
                Color.fromARGB(255, 209, 206, 206), // Color del borde superior
            width: 3.0, // Grosor del borde
          ),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(borderRadiusValue),
          topRight: Radius.circular(borderRadiusValue),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 7, top: 3), // Para ajustar la altura
          child: NavigationBar(
            height: 46,
            selectedIndex: widget.selectedIndex,
            indicatorColor: Colors.transparent,
            indicatorShape: const CircleBorder(eccentricity: 0.2),
            onDestinationSelected: (index) {
             
                widget.onDestinationSelected(index); //actualizar el provider

                _navigateToPage(index, context);
              
            },
            backgroundColor: Colors.white,
            destinations: [
              //Opciones del nav bar
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.house,
                  color: checkBoxColor,
                ),
                selectedIcon: const Icon(
                  CupertinoIcons.house_fill,
                  color: darkColor,
                ),
                label: 'Home',
              ),

              NavigationDestination(
                icon: Icon(
                  Icons.directions_car_filled_outlined,
                  size: 29,
                  color: checkBoxColor,
                ),
                selectedIcon: const Icon(Icons.directions_car_filled_rounded,
                    color: darkColor),
                label: 'Vehículos',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToPage(int index, BuildContext context) {
    //se navega dependiendo del indice seleccionado en el navbar
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(
          context,
          DataConstants.homeScreen,
        );
        break;
      case 1:
        Navigator.pushReplacementNamed(
          context,
          DataConstants.vehiclesScreen,
        );
        break;

    }
  }
}
