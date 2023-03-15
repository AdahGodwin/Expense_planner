import 'package:expense_planner/providers/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Expense> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraint) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: constraint.maxHeight * 0.15,
                      child: const Text('No transactions added yet!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/emptysafe.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            })
          : Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  const Text(
                    "Overview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text(
                          DateFormat.yMMMd().format(
                            DateTime.now(),
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 5,
                          ),
                          child: ListTile(
                            trailing: CircleAvatar(
                              radius: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: FittedBox(
                                  child: Text(
                                    NumberFormat.compactSimpleCurrency(
                                      name: "NGN",
                                    ).format(transactions[index].amount),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                            ),
                            
                          ),
                        );
                      },
                      itemCount: transactions.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
