// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ffvv.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FfvvAdapter extends TypeAdapter<Ffvv> {
  @override
  final int typeId = 3;

  @override
  Ffvv read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ffvv(
      ffvv: fields[0] as int,
      companyId: fields[1] as int,
      branchOfficeId: fields[2] as int,
      description: fields[3] as String,
      state: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Ffvv obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ffvv)
      ..writeByte(1)
      ..write(obj.companyId)
      ..writeByte(2)
      ..write(obj.branchOfficeId)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FfvvAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
