import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/models/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = false;
  String? errorMessage; // Corrected typo

  final Api _api = Api(); // Made final to ensure immutability

  Future<void> fetchUsers() async {
    isLoading = true;
    errorMessage = null;

    try {
      users = await _api.getUsers();
    } catch (e) {
      errorMessage = e.toString();
      print('Error fetching users: $e'); // Added error logging
    } finally {
      isLoading = false;
      notifyListeners(); // Moved to the end to optimize
    }
  }
}
