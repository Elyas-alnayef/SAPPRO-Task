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
      id: fields[0] as int,
      name: fields[1] as String,
      lastName: fields[2] as String,
      age: fields[3] as int,
      gender: fields[4] as String,
      email: fields[5] as String,
      phone: fields[6] as String,
      birthDate: fields[7] as String,
      image: fields[8] as String,
      address: fields[9] as Address,
      imageBytes: fields[10] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.birthDate)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.imageBytes);
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
