import 'package:girman_technologies/features/employees/data/data_source/employee_local_data_source.dart';

import '../data_source/employee_remote_data_source.dart';
import '../models/employee.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> getEmployees();
}

class EmployeeLocalRepositoryImpl implements EmployeeRepository {
  final EmployeeLocalDataSource _employeeLocalDataSource;

  EmployeeLocalRepositoryImpl({required EmployeeLocalDataSource employeeLocalDataSource})
      : _employeeLocalDataSource = employeeLocalDataSource;
  @override
  Future<List<Employee>> getEmployees() async {
    try {
      return await _employeeLocalDataSource.getEmployees();
    } catch (e) {
      rethrow;
    }
  }
}

class EmployeeRemoteRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource _employeeRemoteDataSource;

  EmployeeRemoteRepositoryImpl({required EmployeeRemoteDataSource employeeRemoteDataSource})
      : _employeeRemoteDataSource = employeeRemoteDataSource;

  @override
  Future<List<Employee>> getEmployees() async {
    try {
      return await _employeeRemoteDataSource.getAllEmployees();
    } catch (e) {
      rethrow;
    }
  }
}
