import 'package:flutter/material.dart';
import 'package:pantrypal/screens/pantry_screen.dart';
import 'package:pantrypal/screens/profile_screen.dart';
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
    ProfileScreen(),
  ];

  static final List<String> _titles = [
    'Pantry',
    'Recipes',
    'Paywall',
    'Profile',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);

    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[selectedIndex]),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
            color: colorScheme.primary,
            tooltip: 'Settings',
          )
        ],
        elevation: 0,
      ),
      body: _screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => ref.read(bottomNavIndexProvider.notifier).state = index,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primaryContainer,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.kitchen),
            label: 'Pantry',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt),
            label: 'Recipes',
          ),
          NavigationDestination(
            icon: Icon(Icons.lock),
            label: 'Paywall',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}