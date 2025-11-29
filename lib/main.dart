import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/app_constants.dart';
import 'providers/game_mode_provider.dart';
import 'providers/match_provider.dart';
import 'providers/navigation_provider.dart';
import 'widgets/app_header.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/custom_tab_bar.dart';
import 'widgets/game_category_row.dart';
import 'widgets/game_modes_section.dart';
import 'widgets/match_card.dart';
import 'widgets/player_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => MatchProvider()),
        ChangeNotifierProvider(create: (_) => GameModeProvider()),
      ],
      child: MaterialApp(
        title: 'Esports App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.darkBackground,
          useMaterial3: true,
        ),
        home: const EsportsHomePage(),
      ),
    );
  }
}

class EsportsHomePage extends StatelessWidget {
  const EsportsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header - now scrollable
              const AppHeader(),

              // Game Categories
              const GameCategoryRow(),
              const SizedBox(height: AppSpacing.md),

              // Tab Bar
              const CustomTabBar(),
              const SizedBox(height: AppSpacing.xl),

              // Game Modes
              const GameModesSection(),
              const SizedBox(height: AppSpacing.xl),

              // Match List from Provider
              Consumer<MatchProvider>(
                builder: (context, matchProvider, child) {
                  final matches = matchProvider.matches;
                  return Column(
                    children: [
                      // First match card
                      if (matches.isNotEmpty)
                        MatchCard(
                          date: matches[0].date,
                          time: matches[0].time,
                          title: matches[0].title,
                          subtitle: matches[0].subtitle,
                          entryFee: matches[0].entryFee,
                          prizePool: matches[0].prizePool,
                          elo: matches[0].elo,
                          squads: matches[0].squads,
                          badge: matches[0].badge,
                        ),

                      // Player Selector - appears after first match card
                      if (matches.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.lg),
                        PlayerSelector(
                          onPlayerModeSelected: (mode) {
                            debugPrint('Selected player mode: $mode');
                          },
                        ),
                        const SizedBox(height: AppSpacing.lg),
                      ],

                      // Remaining match cards
                      ...matches.skip(1).map((match) {
                        return MatchCard(
                          date: match.date,
                          time: match.time,
                          title: match.title,
                          subtitle: match.subtitle,
                          entryFee: match.entryFee,
                          prizePool: match.prizePool,
                          elo: match.elo,
                          squads: match.squads,
                          badge: match.badge,
                        );
                      }),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
