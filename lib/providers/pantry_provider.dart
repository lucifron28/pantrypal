
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pantrypal/models/pantry.dart';
import 'package:pantrypal/models/ingredient.dart';
import 'package:pantrypal/services/pantry_repository.dart';
// import 'package:hive/hive.dart';
import 'package:pantrypal/providers/repository_providers.dart';

class PantryNotifier extends StateNotifier<Pantry> {
	final PantryRepository _repo;
	final String _userId;

	PantryNotifier(this._repo, this._userId) : super(Pantry(id: _userId, name: 'My Pantry', ingredients: [], ownerId: _userId)) {
		_loadPantry();
	}

	Future<void> _loadPantry() async {
		final loaded = await _repo.fetchPantry(_userId);
		state = loaded;
	}

	Future<void> addIngredient(Ingredient ingredient) async {
		final updated = Pantry(
			id: state.id,
			name: state.name,
			ingredients: [...state.ingredients, ingredient],
			ownerId: state.ownerId,
			sharedWithUserIds: state.sharedWithUserIds,
		);
		state = updated;
		await _repo.savePantry(updated);
	}
}

final pantryProvider = StateNotifierProvider<PantryNotifier, Pantry>((ref) {
	final repo = ref.watch(pantryRepositoryProvider);
	// TODO: Replace with real user id from auth
	const userId = 'user1';
	return PantryNotifier(repo, userId);
});
