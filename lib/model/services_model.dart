import 'package:hive/hive.dart';
import 'package:iki_nokat_yakyn/hive_helper/hive_types.dart';
import 'package:iki_nokat_yakyn/hive_helper/hive_adapters.dart';
import 'package:iki_nokat_yakyn/hive_helper/fields/services_model_fields.dart';

import '../hive_helper/fields/item_item_fields.dart';
import '../hive_helper/fields/place_fields.dart';
import '../hive_helper/fields/place_item_fields.dart';


part 'services_model.g.dart';


@HiveType(typeId: HiveTypes.servicesModel, adapterName: HiveAdapters.servicesModel)
class ServicesModel extends HiveObject{
	@HiveField(ServicesModelFields.name)
  final String name;
	@HiveField(ServicesModelFields.assets)
  final String assets;
	@HiveField(ServicesModelFields.places)
  final List<Place> places;

  ServicesModel({
    required this.name,
    required this.assets,
    required this.places,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        name: json["name"],
        assets: json["assets"],
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
      );
}


@HiveType(typeId: HiveTypes.place, adapterName: HiveAdapters.place)
class Place extends HiveObject{
	@HiveField(PlaceFields.category)
  final String category;
	@HiveField(PlaceFields.name)
  final String name;
	@HiveField(PlaceFields.items)
  final List<PlaceItem> items;

  Place({
    required this.category,
    required this.name,
    required this.items,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        category: json["category"],
        name: json["name"],
        items: List<PlaceItem>.from(
            json["items"].map((x) => PlaceItem.fromJson(x))),
      );
}




@HiveType(typeId: HiveTypes.placeItem, adapterName: HiveAdapters.placeItem)
class PlaceItem extends HiveObject{
	@HiveField(PlaceItemFields.name)
  final String name;
	@HiveField(PlaceItemFields.icon)
  final String icon;
	@HiveField(PlaceItemFields.category)
  final String category;
	@HiveField(PlaceItemFields.items)
  final List<ItemItem> items;

  PlaceItem({
    required this.name,
    required this.icon,
    required this.category,
    required this.items,
  });

  factory PlaceItem.fromJson(Map<String, dynamic> json) => PlaceItem(
        name: json["name"],
        icon: json["icon"],
        category: json["category"],
        items:
            List<ItemItem>.from(json["items"].map((x) => ItemItem.fromJson(x))),
      );
}




@HiveType(typeId: HiveTypes.itemItem, adapterName: HiveAdapters.itemItem)
class ItemItem extends HiveObject{
	@HiveField(ItemItemFields.phone)
  final String phone;
	@HiveField(ItemItemFields.name)
  final String name;
	@HiveField(ItemItemFields.id)
  final int id;

  ItemItem({
    required this.phone,
    required this.name,
    required this.id,
  });

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        phone: json["phone"],
        name: json["name"],
        id: json["id"],
      );
}