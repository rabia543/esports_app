import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../providers/navigation_provider.dart';

/// Responsive AppHeader widget following overall design
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      color: AppColors.pureBlack,
      child: Row(
        children: [
          // ELO Card
          _buildEloCard(context),

          const Spacer(), // Pushes game selector to the right

          // Game Selector
          _buildGameSelector(context),
        ],
      ),
    );
  }

  /// Build ELO badge card
  Widget _buildEloCard(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.47, 1.0],
              colors: [
                AppColors.gradientRedStart,
                AppColors.gradientRedEnd,
              ],
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Bird/Lightning Icon
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.xs),
                child: Image.asset(
                  'assets/icons/bird_lightning.png',
                  width: AppIconSize.elo,
                  height: AppIconSize.elo,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.flash_on,
                      color: AppColors.textWhite,
                      size: AppIconSize.lg,
                    );
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.sm),

              // ELO Text
              Text(
                '${navProvider.userElo} ELO',
                style: const TextStyle(
                  fontFamily: 'Suisse Int\'l Mono',
                  fontSize: AppFontSize.sm,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textWhite,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGameSelector(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navProvider, child) {
        return Container(
          padding: const EdgeInsets.all(2), // Spacing for gradient border effect
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientBorderStart, // Gradient border
                AppColors.gradientBorderEnd,
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(3), // Black background spacing
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.lg - 1),
              color: AppColors.pureBlack, // Black background
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.md),
                color: AppColors.greyInnerBox,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/bgmi_text.png',
                    height: 28,
                    width: 120,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                        navProvider.selectedGame,
                        style: const TextStyle(
                          color: AppColors.textWhite,
                          fontSize: AppFontSize.sm,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),

                  const SizedBox(width: AppSpacing.xs),

                  // Dropdown Arrow
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: AppColors.textWhite,
                    size: AppIconSize.xxl,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
