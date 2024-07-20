// import 'package:expense_manager/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// import '../providers/expense_provider.dart';
// import '../providers/income_provider.dart';

class Summary extends StatefulWidget {
  final String? dropdownValue;
  final List<String> list;
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  final void Function(String? value) changeValue;

  const Summary(
      {super.key,
      this.dropdownValue,
      required this.changeValue,
      required this.list,
      this.openDrawer,
      this.isDrawerOpen});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    // String formattedSpending =
    //     Provider.of<Expenses>(context).todaysTotalSpending;

    // String monthlyEarnings = Provider.of<Income>(context).totalMonthlyIncome;

    // String formattedIncome = Provider.of<Income>(context).todaysTotalIncome;

    // String monthlySpendings =
    //     Provider.of<Expenses>(context).totalMonthlySpending;
    // String balance = Provider.of<Auth>(context).balance;

    return Container(
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
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
      padding: const EdgeInsets.only(left: 5, top: 20, right: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.bars,
                  size: 25,
                ),
                onPressed: widget.openDrawer,
                color: Colors.white,
              ),
              const Column(
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.wallet,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Total ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.caretDown,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Text(
                    "4000 \$",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              const IconButton(
                icon: Icon(
                  Icons.receipt_long,
                  color: Colors.white,
                ),
                onPressed: null,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
