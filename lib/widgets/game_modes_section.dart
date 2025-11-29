import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../providers/game_mode_provider.dart';

class GameModesSection extends StatefulWidget {
  const GameModesSection({super.key});

  @override
  State<GameModesSection> createState() => _GameModesSectionState();
}

class _GameModesSectionState extends State<GameModesSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            'Game Modes',
            style: AppFonts.subtitleStyle(
              fontSize: AppFontSize.md,
              fontWeight: FontWeight.bold,
              color: AppColors.textWhite,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 90.0,
          child: Row(
            children: [
              // Two-line horizontal scroll indicator at the start
              Padding(
                padding: const EdgeInsets.only(left: AppSpacing.lg),
                child: _buildScrollIndicator(),
              ),
              const SizedBox(width: AppSpacing.md),
              // Horizontal scrollable game mode cards
              Expanded(
                child: Consumer<GameModeProvider>(
                  builder: (context, gameModeProvider, child) {
                    return ListView.separated(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: AppSpacing.lg),
                      itemCount: gameModeProvider.gameModes.length,
                      separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.md),
                      itemBuilder: (context, index) {
                        final gameMode = gameModeProvider.gameModes[index];
                        return _buildGameModeCard(
                          context,
                          title: gameMode.title,
                          subtitle: gameMode.subtitle,
                          iconColor: gameMode.iconColor == 'green' ? AppColors.accentGreen : AppColors.primaryRed,
                          isActive: gameMode.isActive,
                          onTap: () {
                            gameModeProvider.selectGameMode(gameMode.id);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScrollIndicator() {
    return SizedBox(
      width: 12,
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top line - white
          Container(
            width: 12,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),
          // Bottom line - white
          Container(
            width: 12,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameModeCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Color iconColor,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppWidth.gameModeCard,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isActive ? AppColors.cardBackground.withOpacity(0.8) : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadows.subtleShadow,
          border: isActive ? Border.all(color: AppColors.primaryRed, width: 2) : null,
        ),
        child: Row(
          children: [
            // Grey box with SVG vector icon
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: AppColors.textGray.withOpacity(0.2),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              padding: const EdgeInsets.all(AppSpacing.xs),
              child: SvgPicture.asset(
                _getVectorPath(title),
                colorFilter: ColorFilter.mode(
                  AppColors.textWhite,
                  BlendMode.srcIn,
                ),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: AppFonts.titleStyle(
                          fontSize: AppFontSize.xl,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textWhite,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      SvgPicture.asset(
                        'assets/vectors/increasing_arrow_vector.svg',
                        width: AppIconSize.sm,
                        height: AppIconSize.sm,
                        colorFilter: const ColorFilter.mode(
                          AppColors.accentGreen,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    subtitle,
                    style: AppFonts.subtitleStyle(
                      fontSize: AppFontSize.md,
                      fontWeight: FontWeight.normal,
                      color: AppColors.textGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getVectorPath(String title) {
    switch (title.toLowerCase()) {
      case 'sniper':
        return 'assets/vectors/snipper_vector.svg';
      case 'assault':
        return 'assets/vectors/assult_vector.svg';
      default:
        return 'assets/vectors/snipper_vector.svg';
    }
  }
}
