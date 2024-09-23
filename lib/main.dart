import 'package:flutter/material.dart';
import 'package:reflectme/components/bottom_navbar.dart';
import 'package:reflectme/components/top_app_bar.dart';
import 'package:reflectme/screens/explore.dart';
import 'package:reflectme/screens/insights.dart';
import 'package:reflectme/screens/journal.dart';
import 'package:reflectme/screens/history.dart';

void main() {
  runApp(ReflectMe());
}

class ReflectMe extends StatelessWidget {
  const ReflectMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  final name = 'Rathijit';
  final profileImageUrl = 'https://avatars.githubusercontent.com/u/1024025?v=4';

  void handleNavbarIndexChange(int index) {
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
        page = HistoryScreen();
      case 3:
        page = InsightsScreen();
      case 4:
        page = ExploreScreen();
      default:
        throw Exception('No screen for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    TopAppBar(
                      name: name,
                      profileImageUrl: profileImageUrl,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: page,
                        ),
                      ),
                    ),
                  ],
                ),
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