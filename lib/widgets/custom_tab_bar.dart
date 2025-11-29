import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../providers/navigation_provider.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Consumer<NavigationProvider>(
        builder: (context, navProvider, child) {
          return Row(
            children: [
              _buildTab(context, 'Esports', 0, navProvider),
              const SizedBox(width: AppSpacing.lg),
              // Vertical divider
              Container(
                height: AppFontSize.md * 1.2,
                width: 1,
                color: AppColors.textWhite,
              ),
              const SizedBox(width: AppSpacing.lg),
              _buildTab(context, 'Registered Matches', 1, navProvider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label, int index, NavigationProvider navProvider) {
    final isSelected = navProvider.selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        navProvider.selectTab(index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.textWhite : AppColors.textGray,
              fontSize: AppFontSize.lg,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            height: 2.0,
            width: 60.0,
            color: isSelected ? AppColors.primaryRed : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
