import 'package:pantrypal/models/ingredient.dart';

class Recipe {
  final String title;
  final List<Ingredient> ingredients;
  final List<String> instructions;

  Recipe({
    required this.title,
    required this.ingredients,
    required this.instructions,
  });
}
