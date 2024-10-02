import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/employee.dart';

class EmployeeLocalDataSource {
  Future<List<Employee>> getEmployees() async {
    final String response = await rootBundle.loadString('assets/user_list.json');
    final data = await json.decode(response);
    return data.map<Employee>((json) => Employee.fromJson(json)).toList();
  }
}
