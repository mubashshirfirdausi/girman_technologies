import 'package:flutter/foundation.dart';
import 'package:girman_technologies/features/employees/data/repository/employee_repository.dart';

import '../../data/models/employee.dart';

class SearchProvider extends ChangeNotifier {
  final EmployeeRepository _employeeRepository;
  SearchProvider({required EmployeeRepository employeeRepository}) : _employeeRepository = employeeRepository;

  List<Employee> _users = [];
  List<Employee> _searchResults = [];
  bool _isSearching = false;

  List<Employee> get searchResults => _searchResults;
  List<Employee> get users => _users;
  bool get isSearching => _isSearching;

  Future<void> loadUsers() async {
    _users = await _employeeRepository.getEmployees();
    notifyListeners();
  }

  void search(String query) {
    _isSearching = true;
    if (query.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _users.where((user) {
        final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
        return fullName.contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _isSearching = false;
    _searchResults = [];
    notifyListeners();
  }
}
