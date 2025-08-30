import 'package:pantrypal/models/ingredient.dart';
import 'package:uuid/uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'recipe.g.dart';

@HiveType(typeId: 2)
class Recipe {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<Ingredient> ingredients;

  @HiveField(3)
  final List<String> instructions;

  @HiveField(4)
  final int? prepTimeMinutes;

  @HiveField(5)
  final int? cookTimeMinutes;

  @HiveField(6)
  final int? difficulty; // 1-5

  @HiveField(7)
  final String? cuisine;

  @HiveField(8)
  final String? imageUrl;

  @HiveField(9)
  final List<String>? tags;

  @HiveField(10)
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
