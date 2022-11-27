import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart'; // so we can use ChangeNotifier

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
  }
}
