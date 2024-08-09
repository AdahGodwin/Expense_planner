class Income {
  final String id;
  final String description;
  String accountId;
  double amount;
  String category;
  final DateTime date;
  String key;

  Income({
    required this.id,
    required this.description,
    required this.amount,
    required this.accountId,
    required this.category,
    required this.date,
    required this.key,
  });
}
