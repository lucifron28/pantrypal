// Add Ingredient Dialog Widget
import 'package:flutter/material.dart';

class AddIngredientDialog extends StatelessWidget {
  const AddIngredientDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Ingredient'),
      content: Text('Dialog content here'),
    );
  }
}
