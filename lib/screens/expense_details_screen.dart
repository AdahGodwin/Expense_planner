import 'package:expense_planner/providers/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/expense_details/expense_details.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  const ExpenseDetailsScreen({super.key, this.openDrawer, this.isDrawerOpen});
  final VoidCallback? openDrawer;

  final bool? isDrawerOpen;
  @override
  Widget build(BuildContext context) {
    List<Expense> expenses = Provider.of<Expenses>(context).allExpenses;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDrawerOpen!
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: openDrawer,
          color: Colors.white,
        ),
      ),
      body: ExpenseDetails(
        expenses: expenses,
      ),
    );
  }
}
