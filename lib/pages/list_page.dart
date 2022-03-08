import 'package:flutter/material.dart';
import 'package:msg_workshop/models/employee_model.dart';
import 'package:msg_workshop/services/employee_service.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Employee> _employees = [];

  @override
  void initState() {
    super.initState();
    EmployeeService.fetchEmployees().then((data) {
      setState(() {
        _employees = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              setState(() {
                _emp.toggleFav();
              });
            },
          )
        );
      },
      itemCount: _employees.length,
    );
  }
}




// CONDITION ? TRUE : FALSE