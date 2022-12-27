import 'app_database_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseProvider {
  // Favourites Box.
  static final _box = Hive.box<int>(AppDatabaseKeys.favouritesKey);
  // ValueListenable for the box (used in ValueListenableBuilder Widget).
  static ValueListenable<Box<int>> listenable() => _box.listenable();
  // if the box contains the id so isFavourite is true else false.
  static bool isFavourite(int id) => _box.containsKey(id);
  // if the box contains the id so delete the entry else add it.
  static Future<bool> addOrRemoveFromFavourites(int id) async {
    print(id);
    print(favourites());
    if (isFavourite(id)) {
      await _box.delete(id);
      return false;
    } else {
      if (int.tryParse(id.toString()) != null) {
        await _box.put(id, id);
      }
      return true;
    }
  }

  static List<int> favourites() {
    final l = _box.values.toList();
    print(l);
    return l;
  }
}
