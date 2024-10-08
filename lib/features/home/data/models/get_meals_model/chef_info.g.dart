// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chef_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChefDataAdapter extends TypeAdapter<ChefData> {
  @override
  final int typeId = 1;

  @override
  ChefData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChefData(
      id: fields[0] as String?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      brandName: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChefData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.brandName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChefDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
