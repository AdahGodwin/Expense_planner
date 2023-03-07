import 'package:expense_planner/widgets/forms/income_form.dart';
import 'package:flutter/material.dart';

class IncomeFormScreen extends StatelessWidget {
  const IncomeFormScreen({this.isDrawerOpen, super.key});
  final bool? isDrawerOpen;
 @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      color: isDrawerOpen! ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor,
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
                  "New Income",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              height: (mediaQuery.size.height -
                      AppBar().preferredSize.height -
                      mediaQuery.padding.top) *
                  0.8,
              child: IncomeForm(),
            ),
          ],
        ),
      ),
    );
  }
}
