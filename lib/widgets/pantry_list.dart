import 'package:flutter/material.dart';
import 'package:pantrypal/models/pantry.dart';

class PantryList extends StatelessWidget {
  final Pantry pantry;
  const PantryList({super.key, required this.pantry});

  @override
  Widget build(BuildContext context) {
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
          onTap: () {
            // TODO: Show ingredient detail modal
          },
        );
      },
    );
  }
}