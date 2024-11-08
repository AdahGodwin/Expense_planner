import 'package:expense_manager/features/transactions/data/models/expense.dart';
import 'package:expense_manager/features/transactions/data/models/income.dart';
import 'package:expense_manager/shared/providers/filter_provider.dart';
import 'package:expense_manager/shared/components/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../drawer/data/models/drawer_item.dart';
import '../../../transactions/presentation/providers/expense_provider.dart';
import '../../../transactions/presentation/providers/income_provider.dart';
import '../widgets/transaction_list.dart';

const List<String> list = <String>[
  'SPENT THIS MONTH',
  'EARNED THIS MONTH',
];

class HomeScreen extends ConsumerStatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  final void Function(DrawerItem item)? onSelectedItem;
  const HomeScreen(
      {this.openDrawer, this.isDrawerOpen, this.onSelectedItem, super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String? dropdownValue = list.first;

  void changeValue(String? value) {
    setState(() {
      dropdownValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Transaction transactionType = ref.watch(filterProvider);

    List<Expense> expenses = ref.watch(expenseProvider);
    List<Income> income = ref.watch(incomeProvider);
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Header(
              navigationIcon: FontAwesomeIcons.bars,
              titleWidget: Column(
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
                    "0000 \$",
                    style: theme.textTheme.displayMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              height: 0.25,
              icons: IconButton(
                icon: Icon(
                  Icons.receipt_long,
                  color: theme.colorScheme.onPrimary,
                ),
                onPressed: null,
              ),
              showTabs: true,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.16,
              ),
              child: SizedBox(
                height:
                    (mediaQuery.size.height - mediaQuery.padding.top) * 0.84,
                child: TransactionList(
                    transactionType == Transaction.expense ? expenses : income),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
