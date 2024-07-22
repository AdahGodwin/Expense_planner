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
    ThemeData theme = Theme.of(context);
    // String formattedSpending =
    //     Provider.of<Expenses>(context).todaysTotalSpending;

    // String monthlyEarnings = Provider.of<Income>(context).totalMonthlyIncome;

    // String formattedIncome = Provider.of<Income>(context).todaysTotalIncome;

    // String monthlySpendings =
    //     Provider.of<Expenses>(context).totalMonthlySpending;
    // String balance = Provider.of<Auth>(context).balance;

    return Container(
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
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
      padding: const EdgeInsets.only(left: 5, top: 20, right: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.bars,
                  size: 25,
                ),
                onPressed: widget.openDrawer,
                color: theme.colorScheme.onPrimary,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.wallet,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Total ",
                        style: theme.textTheme.displaySmall!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.caretDown,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ],
                  ),
                  Text(
                    "4000 \$",
                    style: theme.textTheme.displayMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.receipt_long,
                  color: theme.colorScheme.onPrimary,
                ),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
