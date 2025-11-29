import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_constants.dart';

/// Player Selector - Displays Solo, Duo, and Squad cards
class PlayerSelector extends StatelessWidget {
  final Function(String)? onPlayerModeSelected;

  const PlayerSelector({
    super.key,
    this.onPlayerModeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        children: [
          // Solo Card
          Expanded(
            child: _PlayerModeCard(
              mode: 'Solo',
              iconPath: 'assets/vectors/solo_vector.svg',
              cardType: PlayerModeCardType.solo,
              onTap: () => onPlayerModeSelected?.call('Solo'),
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Duo Card
          Expanded(
            child: _PlayerModeCard(
              mode: 'Duo',
              iconPath: 'assets/vectors/duo_vector.svg',
              cardType: PlayerModeCardType.duo,
              onTap: () => onPlayerModeSelected?.call('Duo'),
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Squad Card
          Expanded(
            child: _PlayerModeCard(
              mode: 'Squad',
              iconPath: 'assets/vectors/squad_vector.svg',
              cardType: PlayerModeCardType.squad,
              onTap: () => onPlayerModeSelected?.call('Squad'),
            ),
          ),
        ],
      ),
    );
  }
}

enum PlayerModeCardType { solo, duo, squad }

/// Individual Player Mode Card
class _PlayerModeCard extends StatelessWidget {
  final String mode;
  final String iconPath;
  final PlayerModeCardType cardType;
  final VoidCallback? onTap;

  const _PlayerModeCard({
    required this.mode,
    required this.iconPath,
    required this.cardType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppHeight.playerSelectorCard,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadows.subtleShadow,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: Stack(
            children: [
              // Background based on card type
              _buildBackground(),

              // Content: Icon and Text
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  /// Build background based on card type
  Widget _buildBackground() {
    switch (cardType) {
      case PlayerModeCardType.solo:
        return _buildSoloBackground();
      case PlayerModeCardType.duo:
        return _buildDuoBackground();
      case PlayerModeCardType.squad:
        return _buildSquadBackground();
    }
  }

  /// Solo
  Widget _buildSoloBackground() {
    return Container(
      color: AppColors.cardBackground,
    );
  }

  /// Duo
  Widget _buildDuoBackground() {
    return Stack(
      children: [
        // Right side - 70% (darker shade)
        Container(
          color: AppColors.diagonalDark2,
        ),
        // Left side - 30% (lighter shade) with diagonal clip
        ClipPath(
          clipper: DuoDiagonalClipper(),
          child: Container(
            color: AppColors.diagonalLight2,
          ),
        ),
      ],
    );
  }

  Widget _buildSquadBackground() {
    return Stack(
      children: [
        // Base layer - darkest
        Container(
          color: AppColors.diagonalDark1,
        ),
        // Third section - medium dark
        ClipPath(
          clipper: SquadDiagonalClipper(sectionWidth: 0.7),
          child: Container(
            color: AppColors.diagonalLight1,
          ),
        ),
        // Second section - medium
        ClipPath(
          clipper: SquadDiagonalClipper(sectionWidth: 0.45),
          child: Container(
            color: AppColors.cardBackground,
          ),
        ),
        // First section - lightest
        ClipPath(
          clipper: SquadDiagonalClipper(sectionWidth: 0.25),
          child: Container(
            color: AppColors.diagonalLight2,
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Mode text
          Text(
            mode,
            style: const TextStyle(
              color: AppColors.textWhite,
              fontSize: AppFontSize.sm,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.suisseIntlMono,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: AppSpacing.md),

          // SVG Icon
          SvgPicture.asset(
            iconPath,
            width: AppIconSize.lg,
            height: AppIconSize.lg,
            colorFilter: const ColorFilter.mode(
              AppColors.textWhite,
              BlendMode.srcIn,
            ),
            placeholderBuilder: (context) => Icon(
              _getIconFallback(),
              color: AppColors.textWhite,
              size: AppIconSize.lg,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconFallback() {
    switch (cardType) {
      case PlayerModeCardType.solo:
        return Icons.person;
      case PlayerModeCardType.duo:
        return Icons.people;
      case PlayerModeCardType.squad:
        return Icons.groups;
    }
  }
}

/// Custom clipper for Duo card - diagonal split at 30%
class DuoDiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left corner
    path.moveTo(0, 0);

    // Draw to 35% width at top
    path.lineTo(size.width * 0.35, 0);

    // Draw diagonal line to 25% width at bottom
    path.lineTo(size.width * 0.25, size.height);

    // Draw to bottom-left corner
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Custom clipper for Squad card ( multiple diagonal sections)
class SquadDiagonalClipper extends CustomClipper<Path> {
  final double sectionWidth;

  const SquadDiagonalClipper({required this.sectionWidth});

  @override
  Path getClip(Size size) {
    final path = Path();

    final double topWidth = size.width * sectionWidth;
    final double bottomWidth = size.width * (sectionWidth - 0.08);

    path.moveTo(0, 0);
    path.lineTo(topWidth, 0);
    path.lineTo(bottomWidth, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant SquadDiagonalClipper oldClipper) {
    return oldClipper.sectionWidth != sectionWidth;
  }
}
