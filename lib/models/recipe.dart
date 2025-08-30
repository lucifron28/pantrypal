import 'package:pantrypal/models/ingredient.dart';
import 'package:uuid/uuid.dart';

class Recipe {
  final String id;
  final String title;
  final List<Ingredient> ingredients;
  final List<String> instructions;

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
  });

  // New Recipe Constructor
  factory Recipe.newRecipe({
    required String title,
    required List<Ingredient> ingredients,
    required List<String> instructions,
  }) {
    final uuid = Uuid();
    return Recipe(
      id: uuid.v4(),
      title: title,
      ingredients: ingredients,
      instructions: instructions,
    );
  }

  // JSON Serializer
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'ingredients': ingredients.map((i) => i.toJson()).toList(),
        'instructions': instructions,
      };

  // JSON Deserializer
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      ingredients: (json['ingredients'] as List)
          .map((i) => Ingredient.fromJson(i))
          .toList(),
      instructions: List<String>.from(json['instructions']),
    );
  }
}
