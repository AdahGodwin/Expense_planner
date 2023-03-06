import 'package:expense_planner/screens/expense_form_screen.dart';
import 'package:expense_planner/screens/income_form_screen.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: widget.isDrawerOpen! ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: widget.openDrawer,
            color: Colors.white,
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
          ExpenseFormScreen(widget.isDrawerOpen),
          IncomeFormScreen(isDrawerOpen: widget.isDrawerOpen),
        ]),
      ),
    );
  }
}
