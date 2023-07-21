import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String nama_lengkap = ' ';
  String username = ' ';
  String email = ' ';
  String get namalengkap => nama_lengkap;

  void setUser(String names, String user_name, String mail) {
    nama_lengkap = names;
    username = user_name;
    email = mail;
    notifyListeners();
  }

  void updateUserProfile(String names, String newusername, String newEmail) {
    username = newusername;
    nama_lengkap = names;
    email = newEmail;
    notifyListeners();
  }

  Future<void> updateUser(
    String names,
    String user_name,
    String mail,
  ) async {
    this.username = user_name;
    this.nama_lengkap = names;
    this.email = mail;
    notifyListeners();
  }
}
