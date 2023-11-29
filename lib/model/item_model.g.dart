// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class itemModelAdapter extends TypeAdapter<itemModel> {
  @override
  final int typeId = 1;

  @override
  itemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return itemModel(
      title: fields[1] as String,
      des: fields[2] as String,
      image: fields[3] as String,
      price: fields[4] as num,
      isCarted: fields[5] as bool,
      quantity: 0,
    );
  }

  @override
  void write(BinaryWriter writer, itemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.des)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.isCarted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is itemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
