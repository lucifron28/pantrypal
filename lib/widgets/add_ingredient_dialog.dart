// Add Ingredient Dialog Widget
import 'package:flutter/material.dart';


import 'package:pantrypal/models/ingredient.dart';

class AddIngredientDialog extends StatefulWidget {
  const AddIngredientDialog({super.key});

  @override
  State<AddIngredientDialog> createState() => _AddIngredientDialogState();
}

class _AddIngredientDialogState extends State<AddIngredientDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _quantity = '';
  DateTime? _expiryDate;
  String? _category;
  String? _notes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Ingredient'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (val) => _name = val,
                validator: (val) => val == null || val.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Quantity'),
                onChanged: (val) => _quantity = val,
                validator: (val) => val == null || val.isEmpty ? 'Enter a quantity' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category (optional)'),
                onChanged: (val) => _category = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Notes (optional)'),
                onChanged: (val) => _notes = val,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(_expiryDate == null
                        ? 'No expiry date'
                        : 'Expiry: ${_expiryDate!.toLocal().toString().split(' ')[0]}'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
                      );
                      if (picked != null) {
                        setState(() => _expiryDate = picked);
                      }
                    },
                    child: const Text('Pick Expiry'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final ingredient = Ingredient.newIngredient(
                name: _name,
                quantity: _quantity,
                expiryDate: _expiryDate,
                category: _category,
                notes: _notes,
              );
              Navigator.of(context).pop(ingredient);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
