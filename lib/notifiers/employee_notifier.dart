

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:msg_workshop/models/employee_model.dart';
import 'package:msg_workshop/services/employee_service.dart';

class EmployeeNotifier extends ChangeNotifier {
  List<Employee> _employees = [];

  List<Employee> get getEmps => _employees;

  EmployeeNotifier() {
    _initializeEmployeeList();
  }

  _initializeEmployeeList() {
    EasyLoading.show(status: "loading...", maskType: EasyLoadingMaskType.black);
    notifyListeners();
    EmployeeService.fetchEmployees().then((data) {
      _employees = data;
    }).catchError((err) {
      print(err);
    }).whenComplete(() {
      EasyLoading.dismiss();
      notifyListeners();
    });
  }

  void refresh() {
    _initializeEmployeeList();
  }

  int getFavs() {
    return _employees.fold(0, ((prevFavs, emp) {
      return emp.isFav() ? prevFavs + 1 : prevFavs;
    }));
  }

  void toggleFav(Employee emp) {
    int _empIndex = _employees.indexOf(emp);
    _employees[_empIndex].toggleFav();
    notifyListeners();
  }
}