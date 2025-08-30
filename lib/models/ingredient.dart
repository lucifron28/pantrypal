import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 1)
class Ingredient {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String quantity;

  @HiveField(3)
  final DateTime? expiryDate;

  @HiveField(4)
  final String? category;

  @HiveField(5)
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