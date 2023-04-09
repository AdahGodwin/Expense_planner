import 'package:expense_planner/providers/theme.dart';
import 'package:expense_planner/widgets/forms/expense_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseFormScreen extends StatelessWidget {
  const ExpenseFormScreen(this.isDrawerOpen, {super.key});
  final bool? isDrawerOpen;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      color:isDrawerOpen! ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: (mediaQuery.size.height -
                      AppBar().preferredSize.height -
                      mediaQuery.padding.top) *
                  0.2,
              child:const Center(
                child: Text(
                  "New Expense",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              
              decoration:  BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              height: (mediaQuery.size.height -
                      AppBar().preferredSize.height -
                      mediaQuery.padding.top) *
                  0.8,
              child:const ExpenseForm(),
            ),
          ],
        ),
      ),
    );
  }
}
