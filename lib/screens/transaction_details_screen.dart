// import 'package:expense_manager/providers/expense_provider.dart';
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
    return const SizedBox(
      width: 100,
      child: Divider(
        color: Colors.white,
        height: 2,
        thickness: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // List<Expense> expenses = Provider.of<Expenses>(context).allExpenses;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.27,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(8, 195, 111, 1),
                    Color.fromRGBO(5, 180, 128, 1),
                  ],
                  begin: Alignment(-1, -1),
                  end: Alignment(1, 1),
                ),
                borderRadius: BorderRadius.only(
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
                      color: Colors.white,
                    ),
                    const Text(
                      "Transactions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FaIcon(
                          FontAwesomeIcons.download,
                          color: Colors.white,
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
                          child: const Text(
                            "EXPENSES",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
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
                          child: const Text(
                            "INCOME",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
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
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.75,
              child: Card(
                elevation: 7,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Text(
                            "Period",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
