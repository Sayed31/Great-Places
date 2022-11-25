import 'package:flutter/foundation.dart';

import '../models/place.dart'; // so we can use ChangeNotifier

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
