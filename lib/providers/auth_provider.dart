import "dart:io";

import "package:flutter/material.dart";
import "package:intl/intl.dart";

class AuthDetails {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  File? imageFile;
  double? balance;

  AuthDetails({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    this.imageFile,
    this.balance,
  });
}

class Auth with ChangeNotifier {
  AuthDetails? _user;

  AuthDetails? get getUser {
    return _user;
  }

  String get balance {
    return NumberFormat.compactSimpleCurrency(name: "NGN")
        .format(_user?.balance ?? 0);
  }

  void updateBalance(bool isExpense, double amount) {
    if (isExpense) {
      _user?.balance = _user!.balance! - amount;
    } else {
      _user?.balance = _user!.balance! + amount;
    }
  }

  void addUserDetails(
    String firstname,
    String lastname,
    String email,
    String password, [
    File? imageFile,
    double? balance,
  ]) {
    _user = AuthDetails(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
      balance: balance,
      imageFile: imageFile,
    );
    notifyListeners();
  }
}
