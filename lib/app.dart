import 'package:flutter/material.dart';
import 'package:pantrypal/screens/home_screen.dart';
import 'package:pantrypal/screens/pantry_screen.dart';
import 'package:pantrypal/screens/recipe_suggestions_screen.dart';
import 'package:pantrypal/screens/profile_screen.dart';
import 'package:pantrypal/screens/paywall_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:pantrypal/theme.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pantrypal/screens/settings_screen.dart';

class PantryPalApp extends ConsumerWidget {
  const PantryPalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return DynamicColorBuilder(
      builder: (ColorScheme? dynamicLight, ColorScheme? dynamicDark) {
        return MaterialApp(
          title: 'PantryPal',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: dynamicLight ?? lightScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: dynamicDark ?? darkScheme,
          ),
          themeMode: themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
            '/pantry': (context) => PantryScreen(),
            '/recipes': (context) => RecipeSuggestionsScreen(),
            '/paywall': (context) => PaywallScreen(),
            '/profile': (context) => ProfileScreen(),
            '/settings': (context) => SettingsScreen(),
          },
        );
      },
    );
  }
}