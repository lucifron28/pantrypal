import 'package:uuid/uuid.dart';

class Ingredient {
  final String id;
  final String name;
  final String quantity;
  final DateTime? expiryDate;
  final String? category;
  final String? notes;

  Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
    this.expiryDate,
    this.category,
    this.notes,
  });

  factory Ingredient.newIngredient({
    required String name,
    required String quantity,
    DateTime? expiryDate,
    String? category,
    String? notes,
  }) {
    final uuid = Uuid();
    return Ingredient(
      id: uuid.v4(),
      name: name,
      quantity: quantity,
      expiryDate: expiryDate,
      category: category,
      notes: notes,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'expiryDate': expiryDate?.toIso8601String(),
        'category': category,
        'notes': notes,
      };

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      expiryDate: json['expiryDate'] != null ? DateTime.parse(json['expiryDate']) : null,
      category: json['category'],
      notes: json['notes'],
    );
  }
}