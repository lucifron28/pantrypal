// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPreferencesAdapter extends TypeAdapter<UserPreferences> {
  @override
  final int typeId = 4;

  @override
  UserPreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPreferences(
      userId: fields[0] as String,
      favoriteRecipeIds: (fields[1] as List).cast<String>(),
      dietaryPreferences: (fields[2] as List).cast<String>(),
      excludedIngredients: (fields[3] as List).cast<String>(),
      preferredCuisines: (fields[4] as List).cast<String>(),
      budgetLimit: fields[5] as double?,
      maxPrepTime: fields[6] as double?,
      expiryNotifications: fields[7] as bool?,
      locale: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserPreferences obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.favoriteRecipeIds)
      ..writeByte(2)
      ..write(obj.dietaryPreferences)
      ..writeByte(3)
      ..write(obj.excludedIngredients)
      ..writeByte(4)
      ..write(obj.preferredCuisines)
      ..writeByte(5)
      ..write(obj.budgetLimit)
      ..writeByte(6)
      ..write(obj.maxPrepTime)
      ..writeByte(7)
      ..write(obj.expiryNotifications)
      ..writeByte(8)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
