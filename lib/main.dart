import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:msg_workshop/notifiers/employee_notifier.dart';
import 'package:msg_workshop/pages/home_page.dart';
import 'package:msg_workshop/pages/list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _tabIndex = 1;
  List<Widget> _pages = [HomePage(), ListPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: EasyLoading.init(),
        home: ChangeNotifierProvider(
          create: (context) => EmployeeNotifier(),
          child: Builder(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("MSG Workshop"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Provider.of<EmployeeNotifier>(context, listen: false).refresh();
                        },
                        icon: Icon(Icons.refresh))
                  ],
                ),
                body: _pages[_tabIndex],
                bottomNavigationBar: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(icon: Icon(Icons.list), label: "List (${Provider.of<EmployeeNotifier>(context).getFavs()})")
                  ],
                  onTap: (index) {
                    setState(() {
                      _tabIndex = index;
                    });
                  },
                  currentIndex: _tabIndex,
                ),
              );
            }
          ),
        ));
  }
}
