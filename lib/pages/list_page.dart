import 'package:flutter/material.dart';
import 'package:msg_workshop/models/employee_model.dart';
import 'package:msg_workshop/notifiers/employee_notifier.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeNotifier>(
      builder: (context, empNotifier, _) {
        List<Employee> _employees = empNotifier.getEmps;
        return ListView.builder(
          itemBuilder: (context, index) {
            Employee _emp = _employees[index];
            return ListTile(
                title: Text(_emp.name),
                subtitle: Text("\$${_emp.salary}"),
                leading: CircleAvatar(child: Text(_emp.name[0])),
                trailing: IconButton(
                  icon: _emp.isFav()
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    empNotifier.toggleFav(_emp);
                  },
                ));
          },
          itemCount: _employees.length,
        );
      },
    );
  }
}
