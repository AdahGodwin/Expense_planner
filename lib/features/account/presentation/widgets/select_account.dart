import 'package:expense_manager/features/account/data/models/account.dart';
import 'package:expense_manager/features/account/data/models/enums.dart';
import 'package:expense_manager/features/account/presentation/providers/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectAccount extends ConsumerWidget {
  final TransactionType transactionType;
  final String selectedAccountName;
  final Function(TransactionType transferType, Account account)
      onAccountSelected;

  const SelectAccount({
    super.key,
    required this.transactionType,
    required this.selectedAccountName,
    required this.onAccountSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountProvider);

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: const Text("Select Account"),
            contentPadding: const EdgeInsets.all(16),
            children: [
              ...accounts.map((account) => ListTile(
                    leading: FaIcon(account.category.icon,
                        color: account.category.color),
                    title: Text(account.name),
                    onTap: () {
                      onAccountSelected(transactionType, account);
                    },
                  )),
            ],
          ),
        );
      },
      child: Text(
        selectedAccountName,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
