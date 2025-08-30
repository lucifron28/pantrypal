// Recipe Card Widget
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(title: Text('Recipe Card')));
  }
}
