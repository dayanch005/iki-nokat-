import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iki_nokat_yakyn/data/movies_data.dart';
import 'package:iki_nokat_yakyn/model/services_model.dart';



class BookmarkProvider extends ChangeNotifier {
  List<ItemItem> favorite = [];

  List<ItemItem> get favouriteMovies => favorite;

  void getHive() {
    var box = Hive.box('moviesBox');
    box.clear();
    print("object  ${box.values.length}");
    List<dynamic> bazadan = box.get("product", defaultValue: []);
    print("bazadan ${bazadan.length}");
    if (bazadan.isNotEmpty) {
      favorite =
          List<ItemItem>.from(bazadan.map((toElement) => toElement as ItemItem));
    }
  }

  void addToFavourites(ItemItem movie) {
    favorite.add(movie); // Kinony box-a goşmak
    Hive.box("moviesBox").put("product", favorite);
    notifyListeners(); // UI-ni täzeden täzelenme üçin bildiriň
  }

  void removeFromFavourites(ItemItem movie) {
    final index = favorite.toList().indexOf(movie);
    if (index != -1) {
      favorite.removeAt(index); // Kinony box-dan aýyrmak
      Hive.box("moviesBox").put("product", favorite);
      notifyListeners(); // UI-ni täzeden täzelenme üçin bildiriň
    }
  }

  bool isFavourite(ItemItem movie) {
    for (var i = 0; i < favorite.length; i++) {
      if (favorite[i].name == movie.name) {
        return true;
      }
    }

    return false;
  }




}
