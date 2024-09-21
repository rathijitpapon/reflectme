import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reflectme/main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ReflectMeState>();

    if (appState.favorites.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('No favorites yet.'),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have '
                '${appState.favorites.length} favorites:'),
          ),
          for (var pair in appState.favorites)
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text(pair.asLowerCase),
            ),
        ],
      ),
    );
  }
}
