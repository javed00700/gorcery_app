// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroceryAdapter extends TypeAdapter<Grocery> {
  @override
  final int typeId = 0;

  @override
  Grocery read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Grocery()
      ..itemCode = fields[0] as String?
      ..itemName = fields[1] as String?
      ..itemDescription = fields[2] as String?
      ..hasBought = fields[3] as bool?;
  }

  @override
  void write(BinaryWriter writer, Grocery obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.itemCode)
      ..writeByte(1)
      ..write(obj.itemName)
      ..writeByte(2)
      ..write(obj.itemDescription)
      ..writeByte(3)
      ..write(obj.hasBought);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
