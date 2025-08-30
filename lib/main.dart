import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pantrypal/models/ingredient.dart';
import 'package:pantrypal/models/recipe.dart';
import 'package:pantrypal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(RecipeAdapter());

  await Hive.openBox<Ingredient>('ingredients');
  await Hive.openBox<Recipe>('recipes');

  runApp(const PantryPalApp());
}
