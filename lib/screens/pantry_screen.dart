import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pantrypal/providers/pantry_provider.dart';
import 'package:pantrypal/widgets/pantry_list.dart';
import 'package:pantrypal/widgets/add_ingredient_dialog.dart';

class PantryScreen extends ConsumerWidget {
  const PantryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final pantry = ref.watch(pantryProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pantry'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      body: PantryList(pantry: pantry),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final ingredient = await showDialog(
            context: context,
            builder: (context) => const AddIngredientDialog(),
          );
          if (ingredient != null) {
            ref.read(pantryProvider.notifier).addIngredient(ingredient);
          }
        },
        backgroundColor: colorScheme.primary,
        tooltip: 'Add Ingredient',
        child: const Icon(Icons.add),
      ),
    );
  }
}
