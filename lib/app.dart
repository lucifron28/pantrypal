import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/pantry_screen.dart';
import 'screens/recipe_suggestions_screen.dart';
import 'screens/paywall_screen.dart';

class PantryPalApp extends StatelessWidget {
  const PantryPalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PantryPal',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/pantry': (context) => PantryScreen(),
        '/recipes': (context) => RecipeSuggestionsScreen(),
        '/paywall': (context) => PaywallScreen(),
      },
    );
  }
}
