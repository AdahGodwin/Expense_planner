import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionDetailsList extends ConsumerWidget {
  final Map<String, List<dynamic>> groupedTx;
  const TransactionDetailsList({required this.groupedTx, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const Text(
              "Total: \$3000",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          const SizedBox(
            height: 20,
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
                    ...groupedTx.values.toList()[index].map((expense) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: expense.category.color,
                          radius: 20,
                          child: FaIcon(
                            expense.category.icon,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: Text(expense.category.name),
                        subtitle: Text(
                          expense.description,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: Text("\$${expense.amount}",
                            style: const TextStyle(fontSize: 16)),
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
