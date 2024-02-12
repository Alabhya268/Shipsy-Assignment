// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_tickets_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyTicketsHiveModelAdapter extends TypeAdapter<MyTicketsHiveModel> {
  @override
  final int typeId = 0;

  @override
  MyTicketsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyTicketsHiveModel(
      myTickets: (fields[0] as List).cast<Ticket>(),
    );
  }

  @override
  void write(BinaryWriter writer, MyTicketsHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.myTickets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTicketsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
