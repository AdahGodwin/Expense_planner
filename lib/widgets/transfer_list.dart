import 'package:expense_manager/providers/account_provider.dart';
import 'package:expense_manager/providers/transfer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransferList extends ConsumerWidget {
  const TransferList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var groupedTx = ref.watch(transferProvider.notifier).groupTx;
    var getAccount = ref.read(accountProvider.notifier);
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.grey,
                size: 20,
              ),
              Text(
                "July 2023",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          if (groupedTx.isNotEmpty)
            SizedBox(
              height: constraints.maxHeight * 0.8,
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      groupedTx.keys.toList()[index],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    ...groupedTx.values.toList()[index].map((transfer) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: FaIcon(
                              getAccount
                                  .accountById(transfer.toAccountId)[0]
                                  .category
                                  .icon,
                              color: getAccount
                                  .accountById(transfer.toAccountId)[0]
                                  .category
                                  .color,
                              size: 20,
                            ),
                            title: Text(getAccount
                                .accountById(transfer.toAccountId)[0]
                                .name),
                            subtitle: Text(
                              transfer.description,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            trailing: Text(
                              "\$${transfer.amount}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            "Transfer from ${getAccount.accountById(transfer.fromAccountId)[0].name}",
                            style: const TextStyle(color: Colors.black38),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
                itemCount: groupedTx.length,
              ),
            )
        ],
      );
    });
  }
}
