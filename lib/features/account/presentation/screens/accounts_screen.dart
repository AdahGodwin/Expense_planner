import 'package:expense_manager/features/account/presentation/screens/create_account_screen.dart';
import 'package:expense_manager/features/account/presentation/screens/create_transfer_screen.dart';
import 'package:expense_manager/features/account/presentation/screens/transfer_history_screen.dart';
import 'package:expense_manager/features/account/presentation/widgets/accounts_list.dart';
import 'package:expense_manager/features/account/presentation/widgets/custom_icon_button.dart';
import 'package:expense_manager/shared/components/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.18,
              left: 10,
              right: 10,
              bottom: 20,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Total",
                    style: theme.textTheme.displayMedium!
                        .copyWith(color: Colors.black54),
                  ),
                  Text(
                    "5000 \$",
                    style: theme.textTheme.titleLarge,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomIconButton(
                        text: "Transfer history",
                        routeName: TransferHistory.routeName,
                        icon: FontAwesomeIcons.clockRotateLeft,
                      ),
                      CustomIconButton(
                        text: "New Transfer",
                        routeName: CreateTransfer.routeName,
                        icon: FontAwesomeIcons.arrowRightArrowLeft,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AccountsList(),
                ],
              ),
            ),
          ),
          Header(
            titleWidget: Text(
              "Accounts",
              style: theme.textTheme.displayMedium!.copyWith(
                color: Colors.white,
              ),
            ),
            height: .13,
            icons: const SizedBox(
              width: 50,
            ),
            navigationIcon: FontAwesomeIcons.arrowLeft,
            showTabs: false,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateAccount.routeName);
        },
        child: const FaIcon(
          FontAwesomeIcons.plus,
        ),
      ),
    );
  }
}
