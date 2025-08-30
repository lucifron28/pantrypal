import 'package:pantrypal/models/ingredient.dart';
import 'package:uuid/uuid.dart';

class Recipe {
  final String id;
  final String title;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final int? difficulty; // 1-5
  final String? cuisine;
  final String? imageUrl;
  final List<String>? tags;
  final String? authorId;

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.difficulty,
    this.cuisine,
    this.imageUrl,
    this.tags,
    this.authorId,
  });

  factory Recipe.newRecipe({
    required String title,
    required List<Ingredient> ingredients,
    required List<String> instructions,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    int? difficulty,
    String? cuisine,
    String? imageUrl,
    List<String>? tags,
    String? authorId,
  }) {
    final uuid = Uuid();
    return Recipe(
      id: uuid.v4(),
      title: title,
      ingredients: ingredients,
      instructions: instructions,
      prepTimeMinutes: prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes,
      difficulty: difficulty,
      cuisine: cuisine,
      imageUrl: imageUrl,
      tags: tags,
      authorId: authorId,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'ingredients': ingredients.map((i) => i.toJson()).toList(),
        'instructions': instructions,
        'prepTimeMinutes': prepTimeMinutes,
        'cookTimeMinutes': cookTimeMinutes,
        'difficulty': difficulty,
        'cuisine': cuisine,
        'imageUrl': imageUrl,
        'tags': tags,
        'authorId': authorId,
      };

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      ingredients: (json['ingredients'] as List)
          .map((i) => Ingredient.fromJson(i))
          .toList(),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      imageUrl: json['imageUrl'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      authorId: json['authorId'],
    );
  }
}
