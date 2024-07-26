import 'package:expense_manager/screens/transaction_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewTransactionScreen extends StatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  const NewTransactionScreen({super.key, this.isDrawerOpen, this.openDrawer});

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  @override
  void initState() {
    super.initState();
  }

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
    MediaQueryData mediaQuery = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.22,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: const TransactionFormScreen(),
            ),
          ),
          Container(
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
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
                      "Add Transactions",
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
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
        ],
      ),
    );
  }
}
