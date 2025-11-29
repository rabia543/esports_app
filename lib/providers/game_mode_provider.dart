import 'package:flutter/foundation.dart';

import '../models/game_mode.dart';

class GameModeProvider extends ChangeNotifier {
  List<GameMode> _gameModes = [
    GameMode(
      id: '1',
      title: 'Sniper',
      subtitle: 'Ongoing Arena: 20',
      iconColor: 'green',
      isActive: false,
    ),
    GameMode(
      id: '2',
      title: 'Assault',
      subtitle: 'Ongoing Arena: 10',
      iconColor: 'red',
      isActive: false,
    ),
  ];

  List<GameMode> get gameModes => _gameModes;

  GameMode? get selectedGameMode {
    try {
      return _gameModes.firstWhere((mode) => mode.isActive);
    } catch (e) {
      return null;
    }
  }

  void selectGameMode(String id) {
    _gameModes = _gameModes.map((mode) {
      return mode.copyWith(isActive: mode.id == id);
    }).toList();
    notifyListeners();
  }

  void addGameMode(GameMode gameMode) {
    _gameModes.add(gameMode);
    notifyListeners();
  }

  void removeGameMode(String id) {
    _gameModes.removeWhere((mode) => mode.id == id);
    notifyListeners();
  }
}
