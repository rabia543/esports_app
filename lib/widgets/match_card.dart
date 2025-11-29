import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../utils/animations.dart';

class MatchCard extends StatelessWidget {
  final String date;
  final String time;
  final String title;
  final String subtitle;
  final String entryFee;
  final String prizePool;
  final String elo;
  final String squads;
  final String badge;

  const MatchCard({
    super.key,
    required this.date,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.entryFee,
    required this.prizePool,
    required this.elo,
    required this.squads,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Match Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Match Date - ',
                      style: AppFonts.subtitleStyle(
                          fontSize: AppFontSize.md, color: AppColors.textWhite, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '$date | $time',
                      style: AppFonts.subtitleStyle(
                          fontSize: AppFontSize.md, color: AppColors.textGray, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Question mark icon
              Container(
                width: AppIconSize.lg,
                height: AppIconSize.lg,
                decoration: BoxDecoration(
                  color: AppColors.matchInfoDark,
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                ),
                child: const Center(
                  child: Text(
                    '?',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: AppFontSize.lg,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Match Card
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              boxShadow: AppShadows.cardShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Image with ease-out animation
                FadeScaleAnimation(
                  duration: AnimationDurations.medium,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.lg),
                      topRight: Radius.circular(AppRadius.lg),
                    ),
                    child: Image.asset(
                      'assets/images/match_card_iamge.png',
                      height: 140.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        debugPrint('Failed to load match card image: $error');
                        return Container(
                          height: 140.0,
                          width: double.infinity,
                          color: AppColors.darkBackground,
                          child: const Center(
                            child: Icon(
                              Icons.image_outlined,
                              color: AppColors.textGray,
                              size: 48.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Info Section with Diagonal Split Background and Centered Icon
                SizedBox(
                  height: AppHeight.matchInfoSection,
                  child: Stack(
                    children: [
                      // Right side
                      Container(
                        width: double.infinity,
                        height: AppHeight.matchInfoSection,
                        color: AppColors.diagonalDark2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: AppSpacing.lg,
                            top: AppSpacing.md,
                            bottom: AppSpacing.md,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'ENTRY FEES',
                                style: TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: AppFontSize.md,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppFonts.poppins,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                entryFee,
                                style: const TextStyle(
                                  color: AppColors.textGray,
                                  fontSize: AppFontSize.sm,
                                  fontFamily: AppFonts.poppins,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Left side
                      ClipPath(
                        clipper: DiagonalClipper(),
                        child: Container(
                          width: double.infinity,
                          height: AppHeight.matchInfoSection,
                          color: AppColors.diagonalLight2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: AppSpacing.lg,
                              top: AppSpacing.md,
                              bottom: AppSpacing.md,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: AppFontSize.md,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  subtitle,
                                  style: const TextStyle(
                                    color: AppColors.textGray,
                                    fontSize: AppFontSize.sm,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Centered circular game icon overlapping both diagonal sides
                      Center(
                        child: Container(
                          width: AppHeight.gameIconCircle,
                          height: AppHeight.gameIconCircle,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.cardBackground,
                            border: Border.all(
                              color: AppColors.iconBorder,
                              width: 2.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 8.0,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/game_icon_image.png',
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.gamepad,
                                  color: AppColors.textGray,
                                  size: AppIconSize.md,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Spacing before bottom section
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.md),
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.matchInfoLight,
                          borderRadius: BorderRadius.circular(AppRadius.md),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'PRIZE POOL',
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: AppFontSize.xs,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Row(
                                  children: [
                                    Text(
                                      prizePool,
                                      style: const TextStyle(
                                        color: AppColors.textWhite,
                                        fontSize: AppFontSize.sm,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppFonts.poppins,
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    Container(
                                      width: AppWidth.dotIndicator,
                                      height: AppWidth.dotIndicator,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primaryRed,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.xs),
                                    Text(
                                      elo,
                                      style: const TextStyle(
                                        color: AppColors.textGray,
                                        fontSize: AppFontSize.sm,
                                        fontFamily: AppFonts.poppins,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Right side
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: squads.split('/')[0] + '/',
                                        style: const TextStyle(
                                          color: AppColors.textWhite,
                                          fontSize: AppFontSize.sm,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppFonts.poppins,
                                        ),
                                      ),
                                      TextSpan(
                                        text: squads.split('/')[1],
                                        style: const TextStyle(
                                          color: AppColors.primaryRed,
                                          fontSize: AppFontSize.sm,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppFonts.poppins,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                  badge,
                                  style: const TextStyle(
                                    color: AppColors.textGray,
                                    fontSize: AppFontSize.xs,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Creates diagonal split for match info section
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width * 0.65, 0);
    path.lineTo(size.width * 0.35, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
