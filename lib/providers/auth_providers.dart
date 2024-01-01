import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/auth_services.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _signedInUser;
  final authService = AuthServices();
  String token = "";

  User? get signedInUser => _signedInUser;

  User getUserFromToken() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    User user = User(
        id: decodedToken['id'],
        username: decodedToken['username'],
        password: decodedToken['password']);
    //print(user.imagePath);

    return user;
  }

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

  Future<String> getUsernameFromToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    String username = decodedToken['username'];

    return username;
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
