import 'package:msg_workshop/models/employee_model.dart';
import 'package:http/http.dart' as httpClient;
import 'dart:convert';

abstract class EmployeeService {
  static String _base_url = "https://dummy.restapiexample.com/api/v1";

  static Future<List<Employee>> fetchEmployees() async {
    var response = await httpClient.get(Uri.parse(_base_url + '/employees'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List parseResponse = json.decode(response.body)["data"];
      List<Employee> result = [];
      parseResponse.forEach((json) {
        result.add(Employee.fromJson(json));
      });
      return result;
    } else {
      // return [];
      throw Exception("Error loading data ${response.statusCode}");
    }
  }
}