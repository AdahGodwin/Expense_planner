import 'package:collection/collection.dart';
import 'package:expense_manager/db_helper.dart';

import 'package:expense_manager/models/transfer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransferNotifier extends StateNotifier<List<Transfer>> {
  TransferNotifier() : super([]);

  void createTransfer({
    required String fromAccountId,
    required String toAccountId,
    required double amount,
    required DateTime date,
    required String description,
    required String key,
  }) async {
    final newTransfer = Transfer(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fromAccountId: fromAccountId,
      toAccountId: toAccountId,
      amount: amount,
      date: date,
      description: description,
      key: key,
    );

    await DBHelper.insert("transfers", {
      "id": newTransfer.id,
      "fromAccountId": newTransfer.fromAccountId,
      "toAccountId": newTransfer.toAccountId,
      "amount": newTransfer.amount,
      "date": newTransfer.date.millisecondsSinceEpoch,
      "description": newTransfer.description,
      "key": newTransfer.key,
    });
    await fetchAndSetTransfers();
  }

  Future<void> fetchAndSetTransfers() async {
    final dataList = await DBHelper.getData('transfers');
    state = dataList
        .map((transfer) => Transfer(
              id: transfer['id'],
              fromAccountId: transfer['fromAccountId'],
              toAccountId: transfer['toAccountId'],
              amount: double.parse(transfer['amount'].toString()),
              date: DateTime.fromMillisecondsSinceEpoch(transfer['date']),
              description: transfer["description"],
              key: transfer["key"],
            ))
        .toList();
    print(dataList);
  }

  Map<String, List<Transfer>> get groupTx {
    var newMap = groupBy(
        state.sorted((a, b) => a.date.compareTo(b.date)), (obj) => obj.key);
    return newMap;
  }
}

final transferProvider =
    StateNotifierProvider<TransferNotifier, List<Transfer>>((ref) {
  return TransferNotifier();
});
