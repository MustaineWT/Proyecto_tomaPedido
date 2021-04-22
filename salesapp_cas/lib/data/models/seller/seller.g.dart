// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SellerAdapter extends TypeAdapter<Seller> {
  @override
  final int typeId = 1;

  @override
  Seller read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Seller(
      companyId: fields[0] as int,
      branchOfficeId: fields[1] as int,
      personId: fields[2] as int,
      name: fields[3] as String,
      lastName: fields[4] as String,
      dni: fields[5] as String,
      phone: fields[6] as String,
      description: fields[7] as String,
      email: fields[8] as String,
      direction: fields[9] as String,
      city: fields[10] as String,
      country: fields[11] as String,
      state: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Seller obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.companyId)
      ..writeByte(1)
      ..write(obj.branchOfficeId)
      ..writeByte(2)
      ..write(obj.personId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.dni)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.direction)
      ..writeByte(10)
      ..write(obj.city)
      ..writeByte(11)
      ..write(obj.country)
      ..writeByte(12)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SellerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
