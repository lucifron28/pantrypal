import 'package:pantrypal/models/ingredient.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'pantry.g.dart';

@HiveType(typeId: 3)
class Pantry {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<Ingredient> ingredients;

  @HiveField(3)
  final String ownerId;

  @HiveField(4)
  final List<String>? sharedWithUserIds;

  Pantry({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.ownerId,
    this.sharedWithUserIds,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingredients': ingredients.map((i) => i.toJson()).toList(),
        'ownerId': ownerId,
        'sharedWithUserIds': sharedWithUserIds,
      };

  factory Pantry.fromJson(Map<String, dynamic> json) {
    return Pantry(
      id: json['id'],
      name: json['name'],
      ingredients: (json['ingredients'] as List)
          .map((i) => Ingredient.fromJson(i))
          .toList(),
      ownerId: json['ownerId'],
      sharedWithUserIds: json['sharedWithUserIds'] != null
          ? List<String>.from(json['sharedWithUserIds'])
          : null,
    );
  }
}