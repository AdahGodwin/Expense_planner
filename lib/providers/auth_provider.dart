import "dart:io";

import "package:flutter_riverpod/flutter_riverpod.dart";
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

class AuthNotifier extends StateNotifier<AuthDetails> {
  AuthNotifier()
      : super(
          AuthDetails(
              id: "", firstname: "", lastname: "", email: "", balance: 0),
        );

  String get balance {
    return NumberFormat.compactSimpleCurrency(name: "NGN")
        .format(state.balance);
  }

  Future<void> updateBalance(bool isExpense, double amount) async {
    await DBHelper.update("user", {
      "id": state.id,
      "firstname": state.firstname,
      "lastname": state.lastname,
      "email": state.email,
      "image": state.imageFile == null ? "" : state.imageFile!.path,
      "balance": isExpense ? state.balance - amount : state.balance + amount,
    });
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
  }

  Future<void> updateUserDetails(
    String firstname,
    String lastname,
    String email, [
    File? imageFile,
    double balance = 0.0,
  ]) async {
    final user = AuthDetails(
      id: state.id,
      firstname: firstname,
      lastname: lastname,
      email: email,
      balance: balance,
      imageFile: imageFile,
    );
    await DBHelper.update("user", {
      "id": user.id,
      "firstname": user.firstname,
      "lastname": user.lastname,
      "email": user.email,
      "image": user.imageFile == null ? "" : user.imageFile!.path,
      "balance": user.balance,
    });
  }

  Future<bool> getUserDetails() async {
    var userDetails = await DBHelper.getData('user');
    if (userDetails.isEmpty) {
      return false;
    }
    state = AuthDetails(
      id: userDetails[0]["id"],
      firstname: userDetails[0]["firstname"],
      lastname: userDetails[0]["lastname"],
      email: userDetails[0]["email"],
      imageFile:
          userDetails[0]["image"] == "" ? null : File(userDetails[0]["image"]),
      balance: double.parse(userDetails[0]["balance"].toString()),
    );
    return true;
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthDetails>((ref) => AuthNotifier());
