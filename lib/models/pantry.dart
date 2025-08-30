import 'ingredient.dart';

class Pantry {
  final String id;
  final String name;
  final List<Ingredient> ingredients;
  final String ownerId;
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