import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../providers/navigation_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8.0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Consumer<NavigationProvider>(
            builder: (context, navProvider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(context, Icons.sports_esports, 'Esports', 0, navProvider),
                  _buildNavItem(context, Icons.search, 'Search', 1, navProvider),
                  _buildNavItem(context, Icons.leaderboard, 'Leaderboard', 2, navProvider),
                  _buildNavItem(context, Icons.group, 'Group', 3, navProvider),
                  _buildNavItem(context, Icons.person, 'Profile', 4, navProvider),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, NavigationProvider navProvider) {
    final isSelected = navProvider.selectedBottomNavIndex == index;
    return GestureDetector(
      onTap: () {
        navProvider.selectBottomNavItem(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryRed : AppColors.textGray,
            size: AppIconSize.lg,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryRed : AppColors.textGray,
              fontSize: AppFontSize.xs,
            ),
          ),
        ],
      ),
    );
  }
}
