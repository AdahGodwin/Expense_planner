import 'package:expense_manager/models/account.dart';
import 'package:expense_manager/providers/account_provider.dart';
import 'package:expense_manager/screens/create_account_screen.dart';
import 'package:expense_manager/screens/create_transfer_screen.dart';
import 'package:expense_manager/screens/transfer_history_screen.dart';
import 'package:expense_manager/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountsScreen extends ConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    List<Account> accounts = ref.watch(accountProvider);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(TransferHistory.routeName),
                            child: Card(
                              color: theme.colorScheme.primary,
                              elevation: 3,
                              margin: const EdgeInsets.only(
                                bottom: 5,
                                top: 30,
                              ),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: FaIcon(
                                  FontAwesomeIcons.clockRotateLeft,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                          const Text("Transfer history"),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(CreateTransfer.routeName),
                            child: Card(
                              color: theme.colorScheme.primary,
                              elevation: 3,
                              margin: const EdgeInsets.only(
                                bottom: 5,
                                top: 30,
                              ),
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                35,
                              )),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: FaIcon(
                                  FontAwesomeIcons.arrowRightArrowLeft,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                          const Text("New Transfer"),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.teal,
                                        child: FaIcon(
                                          accounts[index].category.icon,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        accounts[index].name,
                                        style: theme.textTheme.displaySmall,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    accounts[index].balance.toString(),
                                    style: theme.textTheme.displaySmall!
                                        .copyWith(
                                            color: accounts[index].balance < 0
                                                ? Colors.red
                                                : null),
                                  )
                                ],
                              ),
                            ));
                      },
                      itemCount: accounts.length,
                    ),
                  ),
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
