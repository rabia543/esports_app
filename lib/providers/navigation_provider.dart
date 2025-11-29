import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedTabIndex = 0;
  int _selectedBottomNavIndex = 0;
  String _selectedGame = 'BATTLEGROUNDS MOBILE INDIA';
  int _userElo = 1500;

  int get selectedTabIndex => _selectedTabIndex;
  int get selectedBottomNavIndex => _selectedBottomNavIndex;
  String get selectedGame => _selectedGame;
  int get userElo => _userElo;

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void selectBottomNavItem(int index) {
    _selectedBottomNavIndex = index;
    notifyListeners();
  }

  void changeGame(String game) {
    _selectedGame = game;
    notifyListeners();
  }

  void updateElo(int elo) {
    _userElo = elo;
    notifyListeners();
  }

  void addElo(int points) {
    _userElo += points;
    notifyListeners();
  }

  void subtractElo(int points) {
    _userElo -= points;
    if (_userElo < 0) _userElo = 0;
    notifyListeners();
  }
}
