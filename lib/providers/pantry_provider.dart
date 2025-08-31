import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pantrypal/models/pantry.dart';
import 'package:pantrypal/models/ingredient.dart';

final pantryProvider = FutureProvider<Pantry>((ref) async {
	// TODO: Replace with real data source (Hive, Firestore, etc.)
	await Future.delayed(const Duration(milliseconds: 500));
	return Pantry(
		id: 'default',
		name: 'My Pantry',
		ingredients: [
			Ingredient(
				id: '1',
				name: 'Eggs',
				quantity: '12',
				expiryDate: DateTime.now().add(const Duration(days: 7)),
			),
			Ingredient(
				id: '2',
				name: 'Milk',
				quantity: '1L',
				expiryDate: DateTime.now().add(const Duration(days: 3)),
			),
		],
		ownerId: 'user1',
	);
});
