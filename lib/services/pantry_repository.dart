import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:pantrypal/models/pantry.dart';

abstract class PantryRepository {
  Future<Pantry> fetchPantry(String userId);
  Future<void> savePantry(Pantry pantry);
  Future<void> syncPantry(String userId);
}

class HivePantryRepository implements PantryRepository {
  @override
  Future<Pantry> fetchPantry(String userId) async {
    final box = await Hive.openBox<Pantry>('pantryBox');
    return box.get(userId) ?? Pantry(id: userId, name: 'My Pantry', ingredients: [], ownerId: userId);
  }

  @override
  Future<void> savePantry(Pantry pantry) async {
    final box = await Hive.openBox<Pantry>('pantryBox');
    await box.put(pantry.ownerId, pantry);
  }

  @override
  Future<void> syncPantry(String userId) async {
    // TODO: Implement sync logic with Firestore
  }
}

class FirestorePantryRepository implements PantryRepository {
  final FirebaseFirestore firestore;
  FirestorePantryRepository(this.firestore);

  @override
  Future<Pantry> fetchPantry(String userId) async {
    final doc = await firestore.collection('pantries').doc(userId).get();
    if (doc.exists) {
      // TODO: Deserialize Firestore data to Pantry
      // return Pantry.fromMap(doc.data()!);
    }
    return Pantry(id: userId, name: 'My Pantry', ingredients: [], ownerId: userId);
  }

  @override
  Future<void> savePantry(Pantry pantry) async {
    await firestore.collection('pantries').doc(pantry.ownerId).set({
      // TODO: Serialize Pantry to Firestore map
      // ...pantry.toMap(),
    });
  }

  @override
  Future<void> syncPantry(String userId) async {
    // TODO: Implement sync logic between Hive and Firestore
  }
}
