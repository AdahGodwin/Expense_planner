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
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.22,
                left: 20,
                right: 20,
              ),
              child: const TransactionFormScreen(),
            ),
          ),
          Container(
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
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
                      "Add Transactions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
        ],
      ),
    );
  }
}
