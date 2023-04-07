import "package:flutter/material.dart";

class AuthDetails {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  AuthDetails({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
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
  ) {
    _user = AuthDetails(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
    );

    notifyListeners();
  }
}
