import 'package:expense_planner/screens/expense_form_screen.dart';
import 'package:expense_planner/screens/income_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewTransactionScreen extends StatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  const NewTransactionScreen({super.key, this.isDrawerOpen, this.openDrawer});

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: widget.openDrawer,
            color: Colors.white,
          ),
          flexibleSpace: Column(
            children: const [
              TabBar(
                  indicatorColor: Colors.white,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: "Expense",
                    ),
                    Tab(
                      text: "Income",
                    ),
                  ])
            ],
          ),
        ),
        body: TabBarView(children: [
          ExpenseFormScreen(),
          IncomeFormScreen(),
        ]),
      ),
    );
  }
}
