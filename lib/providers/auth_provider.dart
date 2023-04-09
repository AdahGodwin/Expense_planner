import "package:flutter/material.dart";

class AuthDetails {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final double? balance;

  AuthDetails({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    this.balance,
  });
}

class Auth with ChangeNotifier {
  AuthDetails? _user;

  AuthDetails? get getUser {
    return _user;
  }

  void addUserDetails(
    String firstname,
    String lastname,
    String email,
    String password,
    [double? balance]
  ) {
    _user = AuthDetails(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
      balance: balance,
    );
    print("${_user?.firstname} ${_user?.lastname} ${_user?.balance}");
    notifyListeners();
  }
}
