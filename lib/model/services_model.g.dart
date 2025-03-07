// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';



class ServicesModelAdapter extends TypeAdapter<ServicesModel> {
  @override
  final int typeId = 0;

  @override
  ServicesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServicesModel(
      name: fields[0] as String,
      assets: fields[1] as String,
      places: (fields[2] as List).cast<Place>(),
    );
  }

  @override
  void write(BinaryWriter writer, ServicesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.assets)
      ..writeByte(2)
      ..write(obj.places);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServicesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlaceAdapter extends TypeAdapter<Place> {
  @override
  final int typeId = 1;

  @override
  Place read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Place(
      category: fields[0] as String,
      name: fields[1] as String,
      items: (fields[2] as List).cast<PlaceItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, Place obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlaceItemAdapter extends TypeAdapter<PlaceItem> {
  @override
  final int typeId = 2;

  @override
  PlaceItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceItem(
      name: fields[0] as String,
      icon: fields[1] as String,
      category: fields[2] as String,
      items: (fields[3] as List).cast<ItemItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlaceItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemItemAdapter extends TypeAdapter<ItemItem> {
  @override
  final int typeId = 3;

  @override
  ItemItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemItem(
      phone: fields[0] as String,
      name: fields[1] as String,
      id: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ItemItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.phone)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
