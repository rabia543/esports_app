class Match {
  final String id;
  final String date;
  final String time;
  final String title;
  final String subtitle;
  final String entryFee;
  final String prizePool;
  final String elo;
  final String squads;
  final String badge;
  final String? bannerImage;

  Match({
    required this.id,
    required this.date,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.entryFee,
    required this.prizePool,
    required this.elo,
    required this.squads,
    required this.badge,
    this.bannerImage,
  });

  Match copyWith({
    String? id,
    String? date,
    String? time,
    String? title,
    String? subtitle,
    String? entryFee,
    String? prizePool,
    String? elo,
    String? squads,
    String? badge,
    String? bannerImage,
  }) {
    return Match(
      id: id ?? this.id,
      date: date ?? this.date,
      time: time ?? this.time,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      entryFee: entryFee ?? this.entryFee,
      prizePool: prizePool ?? this.prizePool,
      elo: elo ?? this.elo,
      squads: squads ?? this.squads,
      badge: badge ?? this.badge,
      bannerImage: bannerImage ?? this.bannerImage,
    );
  }
}
