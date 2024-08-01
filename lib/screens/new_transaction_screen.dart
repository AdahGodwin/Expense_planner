import 'package:expense_manager/screens/transaction_form_screen.dart';
import 'package:expense_manager/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewTransactionScreen extends StatelessWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  const NewTransactionScreen({super.key, this.isDrawerOpen, this.openDrawer});

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
          Header(
            navigationIcon: FontAwesomeIcons.arrowLeft,
            height: 0.2,
            titleWidget: Text(
              "Add Transactions",
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            icons: const SizedBox(
              height: 20,
            ),
            showTabs: true,
          ),
        ],
      ),
    );
  }
}
