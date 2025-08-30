import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/ingredient.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(IngredientAdapter());
  await Hive.openBox<Ingredient>('ingredients');
  runApp(const PantryPalApp());
}
