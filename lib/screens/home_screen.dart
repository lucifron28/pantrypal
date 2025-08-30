import 'package:flutter/material.dart';
import 'package:pantrypal/screens/pantry_screen.dart';
import 'package:pantrypal/screens/recipe_suggestions_screen.dart';
import 'package:pantrypal/screens/paywall_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pantrypal/providers/app_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static final List<Widget> _screens = <Widget>[
    PantryScreen(),
    RecipeSuggestionsScreen(),
    PaywallScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Pantry',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Paywall',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) => ref.read(bottomNavIndexProvider.notifier).state = index,
      ),
    );
  }
}