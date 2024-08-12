import 'package:expense_manager/models/category.dart';

class Account {
  final String id;
  final String name;
  final String type;
  final double balance;
  final Category category;
  Account(
      {required this.id,
      required this.name,
      required this.type,
      required this.balance,
      required this.category});
}
