class Expense {
  String key;
  String transactionId;
  String budgetId;
  String accountId;
  double amount;
  String category;
  DateTime transactionDate;
  String description;

  Expense({
    required this.key,
    required this.transactionId,
    required this.accountId,
    required this.amount,
    required this.budgetId,
    required this.category,
    required this.transactionDate,
    required this.description,
  });
}
