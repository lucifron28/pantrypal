import 'package:flutter/material.dart';
import 'package:pantrypal/models/pantry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pantrypal/providers/pantry_provider.dart';
import 'package:pantrypal/widgets/ingredient_detail_dialog.dart';

class PantryList extends ConsumerWidget {
  final Pantry pantry;
  const PantryList({super.key, required this.pantry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    if (pantry.ingredients.isEmpty) {
      return Center(
        child: Text(
          'No ingredients yet. Tap + to add.',
          style: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: pantry.ingredients.length,
      separatorBuilder: (_, __) => const Divider(height: 16),
      itemBuilder: (context, i) {
        final ingredient = pantry.ingredients[i];
        return ListTile(
          title: Text(ingredient.name, style: TextStyle(color: colorScheme.onSurface)),
          subtitle: Text('Qty: ${ingredient.quantity}', style: TextStyle(color: colorScheme.onSurfaceVariant)),
          trailing: ingredient.expiryDate != null
              ? Text('Exp: ${ingredient.expiryDate!.toLocal().toString().split(" ")[0]}', style: TextStyle(color: colorScheme.error))
              : null,
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) => IngredientDetailDialog(
                ingredient: ingredient,
                onSave: (updated) {
                  ref.read(pantryProvider.notifier).updateIngredient(updated);
                },
                onDelete: () {
                  ref.read(pantryProvider.notifier).deleteIngredient(ingredient.id);
                },
              ),
            );
          },
        );
      },
    );
  }
}