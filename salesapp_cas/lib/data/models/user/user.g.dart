// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      companyId: fields[0] as int,
      bussinesName: fields[1] as String,
      branchOfficeId: fields[2] as int,
      cityBranch: fields[3] as String,
      lastName: fields[4] as String,
      name: fields[5] as String,
      description: fields[6] as String,
      dni: fields[7] as String,
      phone: fields[8] as String,
      email: fields[9] as String,
      direction: fields[10] as String,
      city: fields[11] as String,
      country: fields[12] as String,
      fecha: fields[13] as DateTime,
      route: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.companyId)
      ..writeByte(1)
      ..write(obj.bussinesName)
      ..writeByte(2)
      ..write(obj.branchOfficeId)
      ..writeByte(3)
      ..write(obj.cityBranch)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.dni)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.direction)
      ..writeByte(11)
      ..write(obj.city)
      ..writeByte(12)
      ..write(obj.country)
      ..writeByte(13)
      ..write(obj.fecha)
      ..writeByte(14)
      ..write(obj.route);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
