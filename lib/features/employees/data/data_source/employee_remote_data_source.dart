import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/employee.dart';

class EmployeeRemoteDataSource {
  final FirebaseFirestore _firestore;

  EmployeeRemoteDataSource({required FirebaseFirestore firestore}) : _firestore = firestore;

  //! Added this method to add all employees to the firebase firestore just once
  // Future<void> addAllEmployee() async {
  //   final String response = await rootBundle.loadString('assets/user_list.json');
  //   final data = await json.decode(response);
  //   final List<Employee> employees = data.map<Employee>((json) => Employee.fromJson(json)).toList();
  //   for (var employee in employees) {
  //     FirebaseFirestore.instance.collection('employees').add(employee.toJson());
  //   }
  // }

  Future<List<Employee>> getAllEmployees() async {
    return await _firestore.collection('employees').get().then((snapshot) {
      return snapshot.docs
          .map(
            (doc) => Employee.fromJson(
              doc.data(),
            ),
          )
          .toList();
    });
  }
}
