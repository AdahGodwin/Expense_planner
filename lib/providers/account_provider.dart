import 'package:expense_manager/models/account.dart';
import 'package:expense_manager/shared/accounts_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountNotifier extends StateNotifier<List<Account>> {
  AccountNotifier() : super(accounts);
}

final accountProvider =
    StateNotifierProvider<AccountNotifier, List<Account>>((ref) {
  return AccountNotifier();
});
