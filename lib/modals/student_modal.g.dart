// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudenytModalAdapter extends TypeAdapter<StudenytModal> {
  @override
  final int typeId = 1;

  @override
  StudenytModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudenytModal(
      name: fields[0] as String,
      age: fields[1] as String,
      admissionNo: fields[3] as String,
      courceName: fields[2] as String,
      email: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudenytModal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.courceName)
      ..writeByte(3)
      ..write(obj.admissionNo)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudenytModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
