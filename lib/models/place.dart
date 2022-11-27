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
  final PlaceLocation? location;
  final File image;
  //Since we'll now work with images that are stored on the device, I'll actually use the file data type
  // here.
  // Now file is not a data type built into Flutter but actually into Dart, to unlock it,
  // you need to import dart:io.
  // This gives you access to methods and to types that help you work with files and the file system
  // and that's something Flutter is able to leverage.
  // So here we'll work with files,
  // each image is a file on our device, not a string, not a URL to some image stored in the web but instead
  // a file on our device. Now for location, a location should actually be a combination of things.

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
