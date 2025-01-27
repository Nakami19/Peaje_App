import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  String _selectedCompany = "";

  //Tiempo que se espera para mostrar navbar cuando esta oculta
  final int _showNavBarDelay = 200;

  int get showNavBarDelay => _showNavBarDelay;

  //Compañia seleccionada
  String get selectedCompany => _selectedCompany;

  //Mostrar o no el navbar
  bool get showNavBar => _showNavBar;

  bool _showNavBar = true;

  void updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }

  void updateCompany(String newCompany) {
    _selectedCompany = newCompany;
    notifyListeners();
  }

 void updateShowNavBar(bool isOpened) {
  if (!isOpened) {
    Future.delayed(Duration(milliseconds: _showNavBarDelay), () {
      _showNavBar = true;
      notifyListeners();
    });
  } else {
    _showNavBar = false;
    notifyListeners();
  }
}

void resetValues (){
  _selectedIndex = 0;
  _selectedCompany = "";
  _showNavBar = true;
}

}
