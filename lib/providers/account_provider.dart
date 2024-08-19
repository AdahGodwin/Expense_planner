import 'package:expense_manager/db_helper.dart';
import 'package:expense_manager/models/account.dart';
import 'package:expense_manager/shared/accounts_data.dart';
import 'package:expense_manager/shared/categorydata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountNotifier extends StateNotifier<List<Account>> {
  AccountNotifier() : super(accounts);

  void addAccount({
    required String name,
    required String type,
    required double balance,
    required String categoryName,
  }) async {
    final newAccount = Account(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      type: type,
      balance: balance,
      category: Categories.getCategory(categoryName),
    );

    await DBHelper.insert("accounts", {
      "id": newAccount.id,
      "name": newAccount.name,
      "balance": newAccount.balance,
      "type": newAccount.type,
      "category": newAccount.category.name,
    });
    await fetchAndSetAccounts();
  }

  List<Account> accountById(String accountId) {
    var account = state.where((account) => account.id == accountId).toList();
    if (account.isNotEmpty) {
      return account;
    }
    return [];
  }

  Future<void> fetchAndSetAccounts() async {
    final dataList = await DBHelper.getData('accounts');
    state = dataList
        .map((account) => Account(
              id: account['id'],
              name: account['name'],
              balance: double.parse(account['balance'].toString()),
              type: account['type'],
              category: Categories.getCategory(account["category"]),
            ))
        .toList();
  }
}

final accountProvider =
    StateNotifierProvider<AccountNotifier, List<Account>>((ref) {
  return AccountNotifier();
});
