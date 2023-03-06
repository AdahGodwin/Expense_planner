import 'package:flutter/material.dart';

class ExpenseFormScreen extends StatefulWidget {
  const ExpenseFormScreen(this.isDrawerOpen, {super.key});
  final bool? isDrawerOpen;
  @override
  State<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends State<ExpenseFormScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      color:widget.isDrawerOpen! ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor,
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
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25),
                  right: Radius.circular(25),
                ),
              ),
              height: (mediaQuery.size.height -
                      AppBar().preferredSize.height -
                      mediaQuery.padding.top) *
                  0.8,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
