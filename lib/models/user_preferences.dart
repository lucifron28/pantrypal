import 'package:uuid/uuid.dart';

class UserPreferences {
  final String userId;
  final List<String> favoriteRecipeIds;
  final List<String> dietaryPreferences;
  final List<String> excludedIngredients;
  final List<String> preferredCuisines;
  final double? budgetLimit;
  final double? maxPrepTime;
  final bool? expiryNotifications;
  final String? locale;

  UserPreferences({
    required this.userId,
    this.favoriteRecipeIds = const [],
    this.dietaryPreferences = const [],
    this.excludedIngredients = const [],
    this.preferredCuisines = const [],
    this.budgetLimit,
    this.maxPrepTime,
    this.expiryNotifications,
    this.locale,
  });

  factory UserPreferences.newUser() {
    final uuid = Uuid();
    return UserPreferences(
      userId: uuid.v4(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'favoriteRecipeIds': favoriteRecipeIds,
        'dietaryPreferences': dietaryPreferences,
        'excludedIngredients': excludedIngredients,
        'preferredCuisines': preferredCuisines,
        'budgetLimit': budgetLimit,
        'maxPrepTime': maxPrepTime,
        'expiryNotifications': expiryNotifications,
        'locale': locale,
      };

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      userId: json['userId'],
      favoriteRecipeIds: List<String>.from(json['favoriteRecipeIds'] ?? []),
      dietaryPreferences: List<String>.from(json['dietaryPreferences'] ?? []),
      excludedIngredients: List<String>.from(json['excludedIngredients'] ?? []),
      preferredCuisines: List<String>.from(json['preferredCuisines'] ?? []),
      budgetLimit: (json['budgetLimit'] as num?)?.toDouble(),
      maxPrepTime: (json['maxPrepTime'] as num?)?.toDouble(),
      expiryNotifications: json['expiryNotifications'],
      locale: json['locale'],
    );
  }
}
