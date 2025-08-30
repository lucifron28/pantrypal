import 'package:uuid/uuid.dart';

class UserPreferences {
  final String userId;
  final List<String> favoriteRecipesIds;
  final List<String> dietaryPreferences;
  final List<String> excludedIngredients;
  final List<String> preferredCuisines;
  final double? budgetLimit;
  final double? maxPrepTime;


  UserPreferences({
    required this.userId,
    this.favoriteRecipesIds = const [],
    this.dietaryPreferences = const [],
    this.excludedIngredients = const [],
    this.preferredCuisines = const [],
    this.budgetLimit = 0.0,
    this.maxPrepTime = 0.0,
  });

  factory UserPreferences.newUser() {
    final uuid = Uuid();
    return UserPreferences(
      userId: uuid.v4(),
    );
  }

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      userId: json['userId'],
      favoriteRecipesIds: List<String>.from(json['favoriteRecipesIds'] ?? []),
      dietaryPreferences: List<String>.from(json['dietaryPreferences'] ?? []),
      excludedIngredients: List<String>.from(json['excludedIngredients'] ?? []),
      preferredCuisines: List<String>.from(json['preferredCuisines'] ?? []),
      budgetLimit: (json['budgetLimit'] as num?)?.toDouble(),
      maxPrepTime: (json['maxPrepTime'] as num?)?.toDouble(),
    );
  }
}
