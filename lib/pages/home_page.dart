import 'package:flutter/material.dart';
import 'package:msg_workshop/notifiers/employee_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeNotifier>(
      builder: (context, empsNotifier, _) {
        return Center(child: Text("Number of favorited employees: ${empsNotifier.getFavs()}"));
      },
    );
  }
}