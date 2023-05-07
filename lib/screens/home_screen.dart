import 'package:expense_planner/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/configurations.dart';
import '../providers/auth_provider.dart';
import '../providers/expense_provider.dart';
import '../providers/income_provider.dart';
import '../widgets/transaction_list.dart';

const List<String> list = <String>[
  'SPENT THIS MONTH',
  'EARNED THIS MONTH',
];

class HomeScreen extends StatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  final void Function(DrawerItem item)? onSelectedItem;
  const HomeScreen(
      {this.openDrawer, this.isDrawerOpen, this.onSelectedItem, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isInit = false;
  @override
  void initState() {
    super.initState();
    Provider.of<Expenses>(context, listen: false)
        .fetchAndSetExpenses()
        .then((value) => isInit = true);
    Provider.of<Income>(context, listen: false)
        .fetchAndSetIncome()
        .then((value) => isInit = true);
    Provider.of<Auth>(context, listen: false).getUserDetails();
  }

  String? dropdownValue = list.first;

  void changeValue(String? value) {
    setState(() {
      dropdownValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Expense> expenses = Provider.of<Expenses>(context).todaysExpenses;
    List<IncomeItem> income = Provider.of<Income>(context).todaysIncome;

    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: widget.isDrawerOpen!
          ? Theme.of(context).primaryColorDark
          : Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.3,
              child: isInit == false
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Summary(
                      openDrawer: widget.openDrawer,
                      isDrawerOpen: widget.isDrawerOpen,
                      list: list,
                      dropdownValue: dropdownValue,
                      changeValue: changeValue,
                    ),
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
                child: isInit == false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : TransactionList(
                        dropdownValue == list.first ? expenses : income),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        child: const CircleAvatar(
          radius: 23,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          widget.onSelectedItem!(DrawerItems.addTx);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50.0,
        color: widget.isDrawerOpen!
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor,
      ),
    );
  }
}
