import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatefulWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  State<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  Future? _orderData;
  Future obtainSqlData() async {
    return Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces();
  }

  @override
  void initState() {
    _orderData = obtainSqlData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddPlaceScreen.id);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _orderData,
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                    ? ch!
                    : ListView.builder(
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.items[i].image,
                            ),
                          ),
                          title: Text(greatPlaces.items[i].title),
                        ),
                        itemCount: greatPlaces.items.length,
                      ),
              ),
      ),
    );
  }
}
