import 'package:hive/hive.dart';
import 'package:iki_nokat_yakyn/model/services_model.dart';

void registerAdapters() {
	Hive.registerAdapter(ServicesModelAdapter());
	Hive.registerAdapter(PlaceAdapter());
	Hive.registerAdapter(PlaceItemAdapter());
	Hive.registerAdapter(ItemItemAdapter());
}
