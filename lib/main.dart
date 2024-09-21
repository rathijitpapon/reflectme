import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reflectme/components/bottom_navbar.dart';
import 'package:reflectme/screens/explore.dart';
import 'package:reflectme/screens/favorites_page.dart';
import 'package:reflectme/screens/journal.dart';
import 'package:reflectme/screens/generator_page.dart';

// Documentation

void main() {
  runApp(ReflectMe());
}

class ReflectMe extends StatelessWidget {
  const ReflectMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReflectMeState(),
      child: MaterialApp(
        title: 'ReflectMe',
        theme: ThemeData(
          useMaterial3: true,
          // Remove the colorScheme property
        ),
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade200, Colors.purple.shade200],
              ),
            ),
            child: MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class ReflectMeState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0; 

  void handleNavbarIndexChange(int index) {
    print(index);
    setState(() {
      if (index != 2) {
        selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = JournalScreen();
      case 1:
        page = GeneratorPage();
      case 3:
        page = FavoritesPage();
      case 4:
        page = Explore();
      default:
        throw Exception('No screen for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent, // Make container transparent
                child: page,
              ),
            ),
            BottomNavBar(
              selectedIndex: selectedIndex,
              handleNavbarIndexChange: handleNavbarIndexChange,
            ),
          ],
        );
      }
    );
  }
}