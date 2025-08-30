import 'package:uuid/uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_preferences.g.dart';

@HiveType(typeId: 4)
class UserPreferences {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final List<String> favoriteRecipeIds;

  @HiveField(2)
  final List<String> dietaryPreferences;

  @HiveField(3)
  final List<String> excludedIngredients;

  @HiveField(4)
  final List<String> preferredCuisines;

  @HiveField(5)
  final double? budgetLimit;

  @HiveField(6)
  final double? maxPrepTime;

  @HiveField(7)
  final bool? expiryNotifications;

  @HiveField(8)
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
