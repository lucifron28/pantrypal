// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PantryAdapter extends TypeAdapter<Pantry> {
  @override
  final int typeId = 3;

  @override
  Pantry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pantry(
      id: fields[0] as String,
      name: fields[1] as String,
      ingredients: (fields[2] as List).cast<Ingredient>(),
      ownerId: fields[3] as String,
      sharedWithUserIds: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pantry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.ownerId)
      ..writeByte(4)
      ..write(obj.sharedWithUserIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PantryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
