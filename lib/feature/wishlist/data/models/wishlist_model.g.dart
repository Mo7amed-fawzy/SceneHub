// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishlistModelAdapter extends TypeAdapter<WishlistModel> {
  @override
  final int typeId = 0;

  @override
  WishlistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishlistModel(
      id: fields[0] as String,
      name: fields[1] as String,
      posterPath: fields[2] as String,
      userId: fields[3] as String,
      addedAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WishlistModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.addedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishlistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
