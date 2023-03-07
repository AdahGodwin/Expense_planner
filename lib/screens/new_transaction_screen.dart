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

class _NewTransactionScreenState extends State<NewTransactionScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.isDrawerOpen!
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: widget.openDrawer,
          color: Colors.white,
        ),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
              controller: _tabController,
                indicatorColor: Colors.white,
                labelStyle:
                   const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
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
      body: TabBarView(
        controller: _tabController,
        children: [
        ExpenseFormScreen(widget.isDrawerOpen),
        IncomeFormScreen(isDrawerOpen: widget.isDrawerOpen),
      ]),
    );
  }
}
