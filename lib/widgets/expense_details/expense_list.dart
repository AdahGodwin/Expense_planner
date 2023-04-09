import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../providers/expense_provider.dart';

class ExpenseList extends StatelessWidget {
  final Map<String, List<Expense>> groupTx;
  final DateTime? selectedMonth;
  const ExpenseList({required this.groupTx, this.selectedMonth, super.key});

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
    return groupTx.isEmpty
        ? LayoutBuilder(
            builder: (context, constraint) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: constraint.maxHeight * 0.15,
                      child: Center(
                        child: Text(
                          selectedMonth == null
                              ? "Please Select Month"
                              : 'Ooops!! Nothing To Show Here',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/nothing.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: groupTx.length,
            itemBuilder: (context, index) {
              double totalSpending =
                  groupTx.values.toList()[index].fold(0.0, (sum, item) {
                return sum + item.amount;
              });
              ;
              return Card(
                color: Theme.of(context).primaryColorLight,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 3,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 350,
                  ),
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                    child: Column(
                      children: [
                        ExpansionTile(

                          title: Text(
                            groupTx.keys.toList()[index],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          children: [
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
                            ...groupTx.values.toList()[index].map(
                              (expense) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        listText(
                                          expense.title,
                                          100,
                                        ),
                                        listText(expense.paymentMethod, 120),
                                        listText(
                                          expense.amount < 100000.0
                                              ? NumberFormat.simpleCurrency(
                                                      name: "NGN",
                                                      decimalDigits: 1)
                                                  .format(
                                                  expense.amount,
                                                )
                                              : NumberFormat
                                                  .compactSimpleCurrency(
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
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
