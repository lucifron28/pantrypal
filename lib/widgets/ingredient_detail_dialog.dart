import 'package:flutter/material.dart';
import 'package:pantrypal/models/ingredient.dart';

class IngredientDetailDialog extends StatefulWidget {
  final Ingredient ingredient;
  final void Function(Ingredient updated) onSave;
  final void Function() onDelete;
  const IngredientDetailDialog({super.key, required this.ingredient, required this.onSave, required this.onDelete});

  @override
  State<IngredientDetailDialog> createState() => _IngredientDetailDialogState();
}

class _IngredientDetailDialogState extends State<IngredientDetailDialog> {
  late String _name;
  late String _quantity;
  DateTime? _expiryDate;
  String? _category;
  String? _notes;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _name = widget.ingredient.name;
    _quantity = widget.ingredient.quantity;
    _expiryDate = widget.ingredient.expiryDate;
    _category = widget.ingredient.category;
    _notes = widget.ingredient.notes;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ingredient Details'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (val) => _name = val,
                validator: (val) => val == null || val.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                initialValue: _quantity,
                decoration: const InputDecoration(labelText: 'Quantity'),
                onChanged: (val) => _quantity = val,
                validator: (val) => val == null || val.isEmpty ? 'Enter a quantity' : null,
              ),
              TextFormField(
                initialValue: _category,
                decoration: const InputDecoration(labelText: 'Category (optional)'),
                onChanged: (val) => _category = val,
              ),
              TextFormField(
                initialValue: _notes,
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
                        initialDate: _expiryDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
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
        TextButton(
          onPressed: () {
            widget.onDelete();
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text('Delete'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final updated = Ingredient(
                id: widget.ingredient.id,
                name: _name,
                quantity: _quantity,
                expiryDate: _expiryDate,
                category: _category,
                notes: _notes,
              );
              widget.onSave(updated);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
