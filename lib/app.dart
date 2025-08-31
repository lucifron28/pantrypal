import 'package:flutter/material.dart';
import 'package:pantrypal/screens/home_screen.dart';
import 'package:pantrypal/screens/pantry_screen.dart';
import 'package:pantrypal/screens/recipe_suggestions_screen.dart';
import 'package:pantrypal/screens/profile_screen.dart';
import 'package:pantrypal/screens/paywall_screen.dart';
import 'package:pantrypal/screens/settings_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:pantrypal/theme.dart';

class PantryPalApp extends StatelessWidget {
  const PantryPalApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          themeMode: ThemeMode.system,
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