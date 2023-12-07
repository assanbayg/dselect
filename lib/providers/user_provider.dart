import 'package:flutter/material.dart';
import '../service/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Map<String, dynamic> _userData = {};
  Map<String, dynamic> get userData => _userData;

  // Register a user
  Future<void> registerUser(Map<String, dynamic> userData) async {
    try {
      final result = await _userService.registerUser(userData);
      // Handle successful registration: update user data, set is logged in and other stuff
    } catch (error) {
      // Handle registration failure (also later)
      print('Error registering user: $error');
      rethrow;
    }
  }

  // Log in a user
  Future<void> loginUser(Map<String, dynamic> credentials) async {
    try {
      final result = await _userService.loginUser(credentials);
      // Handle successful login
    } catch (error) {
      // Handle login failure
      print('Error logging in: $error');
      rethrow;
    }
  }

  // Log out a user
  void logoutUser() {
    _isLoggedIn = false;
    _userData = {};
    notifyListeners();
  }
}
