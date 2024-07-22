// import 'package:expense_manager/providers/expense_provider.dart';
import 'package:expense_manager/widgets/transaction_details/transaction_details_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen(
      {super.key, this.openDrawer, this.isDrawerOpen});
  final VoidCallback? openDrawer;

  final bool? isDrawerOpen;

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  bool income = false;
  Widget divider() {
    return SizedBox(
      width: 100,
      child: Divider(
        color: Theme.of(context).colorScheme.onPrimary,
        height: 2,
        thickness: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);
    // List<Expense> expenses = Provider.of<Expenses>(context).allExpenses;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.27,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                  begin: const Alignment(-1, -1),
                  end: const Alignment(1, 1),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                )),
            padding: const EdgeInsets.only(left: 15, top: 35, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                      ),
                      onPressed: widget.openDrawer,
                      color: theme.colorScheme.onPrimary,
                    ),
                    Text(
                      "Transactions",
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: theme.colorScheme.onPrimary,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FaIcon(
                          FontAwesomeIcons.download,
                          color: theme.colorScheme.onPrimary,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            income = false;
                          }),
                          child: Text(
                            "EXPENSES",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        if (income == false) divider()
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            income = true;
                          }),
                          child: Text(
                            "INCOME",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        if (income == true) divider()
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
              left: 16,
              right: 16,
            ),
            child: SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.77,
              child: Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Week",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Month",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Year",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      TransactionDetailsList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
