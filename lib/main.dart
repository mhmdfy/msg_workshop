import 'package:flutter/material.dart';
import 'package:msg_workshop/pages/home_page.dart';
import 'package:msg_workshop/pages/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _tabIndex = 0;
  List<Widget> _pages = [HomePage(), ListPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MSG Workshop"),
          actions: [
            IconButton(
              onPressed: () {
                print("I am refreshing");
              },
              icon: Icon(Icons.refresh))
          ],
        ),
        body: _pages[_tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "List"
            )
          ],
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
          currentIndex: _tabIndex,
        ),
      ),
    );
  }
}