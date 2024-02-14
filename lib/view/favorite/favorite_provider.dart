import 'package:flutter/material.dart';
import 'package:lifepartner/model/favorite_item_model.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<int> favoritedIndices = {};
  void toggleFavorite(int index) {
    if (favoritedIndices.contains(index)) {
      favoritedIndices.remove(index);
    } else {
      favoritedIndices.add(index);
    }
    notifyListeners();
  }

  bool isFavorite(int index) {
    return favoritedIndices.contains(index);
  }

  final List<FavoriteItem> favoriteitem = [];
  void addToFavorite(UserData? dataList) {
    var existingFavoriteItem = favoriteitem
        .indexWhere((item) => item.dataList!.email == dataList!.email);
    if (existingFavoriteItem != -1) {
      return;
    } else {
      favoriteitem.add(FavoriteItem(dataList: dataList));
    }

    notifyListeners();
  }

  int get favcount {
    return favoriteitem.length;
  }

  void removeFavoritetem(int index) {
    if (index >= 0 && index < favoriteitem.length) {
      favoriteitem.removeAt(index);
      notifyListeners();
    }
  }
}
