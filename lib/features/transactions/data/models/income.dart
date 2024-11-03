import 'package:expense_manager/features/category/data/models/category.dart';

class Income {
  final String id;
  final String description;
  String accountId;
  String budgetId;
  double amount;
  Category category;
  final DateTime date;
  String key;

  Income({
    required this.id,
    required this.description,
    required this.amount,
    required this.accountId,
    required this.budgetId,
    required this.category,
    required this.date,
    required this.key,
  });
}
