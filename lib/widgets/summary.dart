import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/expense_provider.dart';
import '../providers/income_provider.dart';

const List<String> list = <String>[
  'SPENT THIS MONTH',
  'EARNED THIS MONTH',
];

class Summary extends StatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  const Summary({super.key, this.openDrawer, this.isDrawerOpen});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    String formattedSpending =
        Provider.of<Expenses>(context).todaysTotalSpending;

    String monthlyEarnings = Provider.of<Income>(context).totalMonthlyIncome;

    String formattedIncome = Provider.of<Income>(context).todaysTotalIncome;

    String monthlySpendings =
        Provider.of<Expenses>(context).totalMonthlySpending;

    return Container(
      padding: const EdgeInsets.only(left: 20, top: 15, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).highlightColor,
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: widget.openDrawer,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: DropdownButton<String>(
                  underline: Container(
                    height: 0,
                  ),
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 40,
                  ),
                  dropdownColor: Theme.of(context).primaryColorDark,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          Text(
            dropdownValue == list.first ? monthlySpendings : monthlyEarnings,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Theme.of(context).highlightColor,
                      child: const Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dropdownValue == list.first
                              ? formattedSpending
                              : formattedIncome,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          dropdownValue == list.first
                              ? "Spent Today"
                              : "Earned Today",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Theme.of(context).highlightColor,
                      child: const Icon(
                        Icons.money,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedIncome,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Balance",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
