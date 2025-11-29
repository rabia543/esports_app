class GameMode {
  final String id;
  final String title;
  final String subtitle;
  final String iconColor;
  final bool isActive;

  GameMode({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    this.isActive = false,
  });

  GameMode copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? iconColor,
    bool? isActive,
  }) {
    return GameMode(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      iconColor: iconColor ?? this.iconColor,
      isActive: isActive ?? this.isActive,
    );
  }
}
