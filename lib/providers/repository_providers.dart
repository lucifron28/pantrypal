import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pantrypal/services/pantry_repository.dart';

final pantryRepositoryProvider = Provider<PantryRepository>((ref) {
  // TODO: Use HivePantryRepository for offline, FirestorePantryRepository for sync
  return HivePantryRepository();
});
