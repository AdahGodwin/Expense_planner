import 'package:expense_manager/features/account/data/models/account.dart';
import 'package:expense_manager/features/account/presentation/providers/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountsList extends ConsumerWidget {
  const AccountsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);

    List<Account> accounts = ref.watch(accountProvider);

    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              elevation: 1,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: FaIcon(
                            accounts[index].category.icon,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          accounts[index].name,
                          style: theme.textTheme.displaySmall,
                        ),
                      ],
                    ),
                    Text(
                      accounts[index].balance.toString(),
                      style: theme.textTheme.displaySmall!.copyWith(
                          color:
                              accounts[index].balance < 0 ? Colors.red : null),
                    )
                  ],
                ),
              ));
        },
        itemCount: accounts.length,
      ),
    );
  }
}
