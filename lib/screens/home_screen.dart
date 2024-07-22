import 'package:expense_manager/widgets/summary.dart';
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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.25,
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
            Padding(
              padding: EdgeInsets.only(
                top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.13,
              ),
              child: SizedBox(
                height:
                    (mediaQuery.size.height - mediaQuery.padding.top) * 0.87,
                child: Container(
                  child: isInit == false
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : TransactionList(
                          dropdownValue == list.first ? expenses : income),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
