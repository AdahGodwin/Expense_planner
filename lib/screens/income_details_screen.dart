import 'package:expense_planner/providers/income_provider.dart';
import 'package:expense_planner/widgets/income_details/income_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncomeDetailsScreen extends StatelessWidget {
  const IncomeDetailsScreen({super.key, this.openDrawer, this.isDrawerOpen});
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  @override
  Widget build(BuildContext context) {
    List<IncomeItem> income = Provider.of<Income>(context).allIncome;
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
      body: SingleChildScrollView(
        child: IncomeDetails(income: income),
      ),
    );
  }
}
