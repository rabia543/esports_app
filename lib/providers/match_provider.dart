import 'package:flutter/foundation.dart';

import '../models/match.dart';

class MatchProvider extends ChangeNotifier {
  List<Match> _matches = [
    Match(
      id: '1',
      date: 'Sun Oct 05',
      time: '2:30pm',
      title: 'Battle Royal',
      subtitle: 'Erangel',
      entryFee: '₹ 59/player',
      prizePool: '₹ 3000',
      elo: '500 ELO',
      squads: '23/25 SQUADS',
      badge: 'KNOCKOUT',
    ),
    Match(
      id: '2',
      date: 'Mon Oct 06',
      time: '4:00pm',
      title: 'Battle Royal',
      subtitle: 'Miramar',
      entryFee: '₹ 99/player',
      prizePool: '₹ 5000',
      elo: '750 ELO',
      squads: '20/25 SQUADS',
      badge: 'CLASSIC',
    ),
    Match(
      id: '3',
      date: 'Tue Oct 07',
      time: '6:30pm',
      title: 'Team Deathmatch',
      subtitle: 'Vikendi',
      entryFee: '₹ 79/player',
      prizePool: '₹ 4000',
      elo: '600 ELO',
      squads: '18/20 SQUADS',
      badge: 'INTENSE',
    ),
  ];

  List<Match> get matches => _matches;

  void addMatch(Match match) {
    _matches.add(match);
    notifyListeners();
  }

  void removeMatch(String matchId) {
    _matches.removeWhere((match) => match.id == matchId);
    notifyListeners();
  }

  void updateMatch(Match updatedMatch) {
    final index = _matches.indexWhere((match) => match.id == updatedMatch.id);
    if (index != -1) {
      _matches[index] = updatedMatch;
      notifyListeners();
    }
  }

  Match? getMatchById(String id) {
    try {
      return _matches.firstWhere((match) => match.id == id);
    } catch (e) {
      return null;
    }
  }
}
