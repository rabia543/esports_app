import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// Game Category Row with selectable icons and responsive design
/// Shows Arena, Zenith League, Championship with selection state
class GameCategoryRow extends StatefulWidget {
  const GameCategoryRow({super.key});

  @override
  State<GameCategoryRow> createState() => _GameCategoryRowState();
}

class _GameCategoryRowState extends State<GameCategoryRow> {
  // Track selected category index (0: Arena, 1: Zenith League, 2: Championship)
  int _selectedIndex = 0;

  // Category data
  final List<Map<String, String>> _categories = [
    {
      'image': 'assets/images/arena_logo.png',
      'label': 'Arena',
      'placeholder': 'A',
    },
    {
      'image': 'assets/images/zenith_league_logo.png',
      'label': 'Zenith League',
      'placeholder': 'Z',
    },
    {
      'image': 'assets/images/championship_logo.png',
      'label': 'Championship',
      'placeholder': 'C',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group the three category icons together on the left
          _buildCategoryIcon(
            index: 0,
            imagePath: _categories[0]['image']!,
            label: _categories[0]['label']!,
            placeholder: _categories[0]['placeholder']!,
          ),
          const SizedBox(width: AppSpacing.sm),
          _buildCategoryIcon(
            index: 1,
            imagePath: _categories[1]['image']!,
            label: _categories[1]['label']!,
            placeholder: _categories[1]['placeholder']!,
          ),
          const SizedBox(width: AppSpacing.sm),
          _buildCategoryIcon(
            index: 2,
            imagePath: _categories[2]['image']!,
            label: _categories[2]['label']!,
            placeholder: _categories[2]['placeholder']!,
          ),
          const Spacer(),

          SizedBox(
            height: AppHeight.gameCategoryIcon,
            child: Center(
              child: Icon(
                Icons.more_vert,
                color: AppColors.textWhite,
                size: AppIconSize.xxl,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build individual category icon with selection state
  Widget _buildCategoryIcon({
    required int index,
    required String imagePath,
    required String label,
    required String placeholder,
  }) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: AppHeight.gameCategoryIcon,
              height: AppHeight.gameCategoryIcon,
              padding: const EdgeInsets.all(AppSpacing.xs),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: isSelected
                    ? Border.all(
                        color: AppColors.textWhite,
                        width: 2,
                      )
                    : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Show placeholder letter if image not found
                    // Also print error to console for debugging
                    debugPrint('Failed to load image: $imagePath');
                    debugPrint('Error: $error');
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                      child: Center(
                        child: Text(
                          placeholder,
                          style: const TextStyle(
                            color: AppColors.textWhite,
                            fontSize: AppFontSize.xxl,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            SizedBox(
              height: AppFontSize.sm * 3.5,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? AppColors.textWhite : AppColors.textGray,
                    fontSize: AppFontSize.sm,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
