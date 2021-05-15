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
      mo: fields[5] as int,
      tu: fields[6] as int,
      we: fields[7] as int,
      th: fields[8] as int,
      fr: fields[9] as int,
      sa: fields[10] as int,
      su: fields[11] as int,
      ffvv: fields[12] as int,
      state: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Routes obj) {
    writer
      ..writeByte(14)
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
      ..write(obj.mo)
      ..writeByte(6)
      ..write(obj.tu)
      ..writeByte(7)
      ..write(obj.we)
      ..writeByte(8)
      ..write(obj.th)
      ..writeByte(9)
      ..write(obj.fr)
      ..writeByte(10)
      ..write(obj.sa)
      ..writeByte(11)
      ..write(obj.su)
      ..writeByte(12)
      ..write(obj.ffvv)
      ..writeByte(13)
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
