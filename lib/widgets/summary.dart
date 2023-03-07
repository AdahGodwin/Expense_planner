import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/expense_provider.dart';
import '../providers/income_provider.dart';

class Summary extends StatelessWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  const Summary({super.key, this.openDrawer, this.isDrawerOpen});

  @override
  Widget build(BuildContext context) {
    double todaysTotalSpending =
        Provider.of<Expenses>(context).todaysTotalSpending;
    String formattedSpending = NumberFormat.compactSimpleCurrency(name: "NGN")
        .format(todaysTotalSpending);

    double todaysTotalIncome =
        Provider.of<Income>(context).todaysTotalIncome;
    String formattedIncome = NumberFormat.compactSimpleCurrency(name: "NGN")
        .format(todaysTotalIncome);    

    return Container(
      padding: const EdgeInsets.only(left: 16, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).highlightColor,
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: openDrawer,
                  color: Colors.white,
                ),
              ),
              const Text(
                "TOTAL SPENT TODAY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
          Text(
            formattedSpending,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).highlightColor,
                child: const Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Todays Income: $formattedIncome",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
