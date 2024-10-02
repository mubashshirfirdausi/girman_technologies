import 'package:uuid/v6.dart';

class Employee {
  String? id;
  String? firstName;
  String? lastName;
  String? city;
  String? contactNumber;

  Employee({
    this.id,
    this.firstName,
    this.lastName,
    this.city,
    this.contactNumber,
  });

  // Factory constructor to create an Employee from JSON
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: const UuidV6().generate(),
      firstName: json['first_name'],
      lastName: json['last_name'],
      city: json['city'],
      contactNumber: json['contact_number'],
    );
  }

  // Method to convert an Employee object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'city': city,
      'contact_number': contactNumber,
    };
  }
}
