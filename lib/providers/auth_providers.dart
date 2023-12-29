import 'package:flutter/material.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/auth_services.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _signedInUser;
  final authService = AuthServices();
  String token = "";

  User? get signedInUser => _signedInUser;

  Future<String> registration({required User user}) async {
    token = await authService.register(user: user);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }

  Future<String> loggingIn({required User user}) async {
    token = await authService.login(user: user);
    _signedInUser = user; // Set the signed-in user.
    saveTokenInStorage(token);
    notifyListeners();
    return token;
  }

  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString('token', token);
  }

  //readTokenFromStorage

  Future<String> readFromStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    /// ??  null check operator
    notifyListeners();
    return token;
  }

  Future<void> logOut() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("token", '');
    token = "";
    _signedInUser = null; // Clear the signed-in user.
    saveTokenInStorage(token);
    notifyListeners();
  }
}
