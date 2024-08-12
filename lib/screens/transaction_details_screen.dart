// import 'package:expense_manager/providers/expense_provider.dart';
import 'package:expense_manager/models/expense.dart';
import 'package:expense_manager/models/income.dart';
import 'package:expense_manager/providers/expense_provider.dart';
import 'package:expense_manager/providers/filter_provider.dart';
import 'package:expense_manager/providers/income_provider.dart';
import 'package:expense_manager/widgets/header_widget.dart';
import 'package:expense_manager/widgets/transaction_details/transaction_details_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

class TransactionDetailsScreen extends ConsumerWidget {
  const TransactionDetailsScreen(
      {super.key, this.openDrawer, this.isDrawerOpen});
  final VoidCallback? openDrawer;

  final bool? isDrawerOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Transaction transactionType = ref.watch(filterProvider);

    Map<String, List<Expense>> groupedExpenses =
        ref.watch(expenseProvider.notifier).groupTx;

    Map<String, List<Income>> groupedIncome =
        ref.watch(incomeProvider.notifier).groupTx;

    var mediaQuery = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Header(
            navigationIcon: FontAwesomeIcons.arrowLeft,
            titleWidget: Text(
              "Transactions",
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            height: 0.27,
            icons: Row(
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
            showTabs: true,
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
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
                      Expanded(
                        child: TransactionDetailsList(
                            groupedTx: transactionType == Transaction.expense
                                ? groupedExpenses
                                : groupedIncome),
                      ),
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
