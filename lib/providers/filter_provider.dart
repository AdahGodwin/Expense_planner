import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Transaction {
  income,
  expense,
}

class FilterNotifier extends StateNotifier<Transaction> {
  FilterNotifier() : super(Transaction.expense);

  void toggleTransaction(Transaction transactionType) {
    state = transactionType;
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Transaction>((ref) {
  return FilterNotifier();
});
