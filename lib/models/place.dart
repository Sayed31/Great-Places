import 'dart:io'; // so we can use File datatype
import 'package:flutter/foundation.dart'; // so we can use required

class PlaceLocation {
  final double latitude;
  final double longitude;
  String address;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address = "",
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
