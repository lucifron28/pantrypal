import 'package:uuid/uuid.dart';

class Ingredient {
  final String id;
  final String name;
  final String quantity;

  Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
  });

  // New Ingredient Constructor
  factory Ingredient.newIngredient({
    required String name,
    required String quantity,
  }) {
    final uuid = Uuid();
    return Ingredient(
      id: uuid.v4(),
      name: name,
      quantity: quantity,
    );
  }

  // JSON Serializer
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
      };

  // JSON Deserializer
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}