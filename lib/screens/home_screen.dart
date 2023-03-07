import 'package:expense_planner/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  const HomeScreen({this.openDrawer, this.isDrawerOpen, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
  List<Expense> expenses = Provider.of<Expenses>(context).todaysExpenses;
  
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: widget.isDrawerOpen!
          ? Theme.of(context).primaryColorDark
          : Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.3,
              child: Summary(
                  openDrawer: widget.openDrawer,
                  isDrawerOpen: widget.isDrawerOpen),
            ),
            SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.7,
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child:
                      TransactionList(expenses),),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 50.0,
        shape: CircularNotchedRectangle(),
        color: Colors.white70,
      ),
    );
  }
}
