import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../providers/expense_provider.dart';

class ExpenseList extends StatefulWidget {
  final Map<String, List<Expense>> groupTx;
  const ExpenseList({required this.groupTx, super.key});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  bool _expanded = false;

  Widget titleText(String text, double width) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget listText(
    String text,
    double width,
  ) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.groupTx.length,
      itemBuilder: (context, index) {
        double totalSpending =
            widget.groupTx.values.toList()[index].fold(0.0, (sum, item) {
          return sum + item.amount;
        });
        ;
        return Card(
          color: Theme.of(context).primaryColorLight,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 3,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _expanded
                ? min(widget.groupTx.values.toList()[index].length * 20.0 + 130,
                    350)
                : 55,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _expanded
                  ? min(
                      widget.groupTx.values.toList()[index].length * 20.0 + 20,
                      120)
                  : 0,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.groupTx.keys.toList()[index],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          child: Text(
                            _expanded ? "Collapse" : "Expand",
                            style: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            setState(() {
                              _expanded = !_expanded;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        titleText("Title", 100),
                        titleText("Payment Method", 125),
                        titleText("Amount", 80),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...widget.groupTx.values.toList()[index].map(
                      (expense) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                listText(
                                  expense.title,
                                  100,
                                ),
                                listText(expense.paymentMethod, 120),
                                listText(
                                  expense.amount < 100000.0
                                      ? NumberFormat.simpleCurrency(
                                              name: "NGN", decimalDigits: 1)
                                          .format(
                                          expense.amount,
                                        )
                                      : NumberFormat.compactSimpleCurrency(
                                          name: "NGN",
                                        ).format(
                                          expense.amount,
                                        ),
                                  80,
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Divider(
                                  height: 2,
                                  color: Colors.white70,
                                  thickness: 1),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleText("Total", 100),
                        titleText(
                            totalSpending < 100000.0
                                ? NumberFormat.simpleCurrency(
                                        name: "NGN", decimalDigits: 1)
                                    .format(
                                    totalSpending,
                                  )
                                : NumberFormat.compactSimpleCurrency(
                                    name: "NGN",
                                  ).format(totalSpending),
                            80),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
