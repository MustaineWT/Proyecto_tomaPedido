// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoutesAdapter extends TypeAdapter<Routes> {
  @override
  final int typeId = 2;

  @override
  Routes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Routes(
      companyId: fields[0] as int,
      branchOfficeId: fields[1] as int,
      route: fields[2] as String,
      description: fields[3] as String,
      zone: fields[4] as String,
      ffvv: fields[5] as int,
      state: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Routes obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.companyId)
      ..writeByte(1)
      ..write(obj.branchOfficeId)
      ..writeByte(2)
      ..write(obj.route)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.zone)
      ..writeByte(5)
      ..write(obj.ffvv)
      ..writeByte(6)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoutesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
