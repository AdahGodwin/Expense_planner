import 'package:flutter/material.dart';

class IncomeFormScreen extends StatefulWidget {
  const IncomeFormScreen({super.key});

  @override
  State<IncomeFormScreen> createState() => _IncomeFormScreenState();
}

class _IncomeFormScreenState extends State<IncomeFormScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      color: Theme.of(context).primaryColorDark,
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
