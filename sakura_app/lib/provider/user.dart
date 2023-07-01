import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String username = '';
  String email = '';

  void setUser(String name, String mail) {
    username = name;
    email = mail;
    notifyListeners();
  }

  void updateUserProfile(String newUsername, String newEmail) {
    username = newUsername;
    email = newEmail;
    notifyListeners();
  }
 
  Future<void> updateUser(String username, String email,  ) async {
        this.username = username;
    this.email = email;
      notifyListeners();
  }

}
