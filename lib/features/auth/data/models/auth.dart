import 'dart:io';

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
