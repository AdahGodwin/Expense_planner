import "dart:io";

import "package:flutter/material.dart";
import "package:intl/intl.dart";

import '../db_helpers/db_helper.dart';

class AuthDetails {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  File? imageFile;
  double balance = 0.0;

  AuthDetails({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    this.imageFile,
    required this.balance,
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

  Future<void> updateBalance(bool isExpense, double amount) async {
   await DBHelper.update("user", {
      "id": _user!.id,
      "firstname": _user!.firstname,
      "lastname": _user!.lastname,
      "email": _user!.email,
      "image": _user!.imageFile == null ? "" : _user!.imageFile!.path,
      "balance": isExpense ? _user!.balance - amount : _user!.balance + amount,
    });
    notifyListeners();
  }

  Future<void> addUserDetails(
    String firstname,
    String lastname,
    String email, [
    File? imageFile,
    double balance = 0.0,
  ]) async {
    final user = AuthDetails(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      firstname: firstname,
      lastname: lastname,
      email: email,
      balance: balance,
      imageFile: imageFile,
    );
    await DBHelper.insert("user", {
      "id": user.id,
      "firstname": user.firstname,
      "lastname": user.lastname,
      "email": user.email,
      "image": user.imageFile == null ? "" : user.imageFile!.path,
      "balance": user.balance,
    });
    notifyListeners();
  }

  Future<void> getUserDetails() async {
    final userDetails = await DBHelper.getData('user');
    _user = AuthDetails(
      id: userDetails[0]["id"],
      firstname: userDetails[0]["firstname"],
      lastname: userDetails[0]["lastname"],
      email: userDetails[0]["email"],
      imageFile:
          userDetails[0]["image"] == "" ? null : File(userDetails[0]["image"]),
      balance: double.parse(userDetails[0]["balance"].toString()),
    );
    notifyListeners();
  }

  void deleteTable(table) {
    DBHelper.deleteData(table);
    notifyListeners();
  }
}
