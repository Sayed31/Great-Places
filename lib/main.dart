import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: Colors.indigo,
          ),
          appBarTheme: AppBarTheme(
            color: Colors.indigo,
          ),
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber,
            //Theme.of(context).colorScheme.secondary;
          ),
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.id: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
