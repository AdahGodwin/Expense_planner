import "package:expense_manager/models/auth.dart";
import "package:expense_manager/models/configurations.dart";
import "package:expense_manager/providers/drawer_provider.dart";
import "package:expense_manager/providers/theme.dart";
import "package:expense_manager/screens/accounts_screen.dart";
import "package:expense_manager/screens/category_screen.dart";
import "package:expense_manager/screens/create_reminder_screen.dart";
import "package:expense_manager/screens/transaction_details_screen.dart";
import "package:expense_manager/screens/home_screen.dart";
import "package:expense_manager/screens/new_transaction_screen.dart";
import 'package:expense_manager/screens/settings_screen/settings_screen.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

import "../providers/auth_provider.dart";

class DrawerScreen extends ConsumerStatefulWidget {
  const DrawerScreen({super.key});

  @override
  ConsumerState<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends ConsumerState<DrawerScreen> {
  DrawerItem item = DrawerItems.home;
  void onSelectedItem(item) {
    setState(() {
      this.item = item;
      Future.delayed(
        const Duration(milliseconds: 150),
        () {
          ref.read(drawerProvider.notifier).closeDrawer();
        },
      );
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    DrawerSpecs drawerSpecs = ref.watch(drawerProvider);
    AuthDetails user = ref.read(authProvider);
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.secondary,
            ],
            begin: const Alignment(-1, -1),
            end: const Alignment(1, 1),
          ),
        ),
        child: Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: user.imageFile != null
                                ? FileImage(user.imageFile!)
                                : null,
                          ),
                          title: Text(
                            "${user.firstname == "" ? "John" : user.firstname} ${user.lastname == "" ? "Doe" : user.lastname}",
                            style: theme.textTheme.displayMedium!.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                          subtitle: Text(
                            user.email == ""
                                ? " johndoe@gmail.com"
                                : user.email,
                            style: theme.textTheme.displaySmall!.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      Switch(
                        activeTrackColor: Colors.black38,
                        inactiveTrackColor: Colors.grey,
                        activeColor: Colors.yellow,
                        inactiveThumbColor: Colors.white,
                        activeThumbImage:
                            const AssetImage('assets/images/sun.png'),
                        inactiveThumbImage:
                            const AssetImage('assets/images/moon2.png'),
                        value: ref.watch(themeProvider),
                        onChanged: (value) {
                          ref.read(themeProvider.notifier).toggleTheme();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Column(
                    children: DrawerItems.all
                        .map((item) => ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              onTap: () => onSelectedItem(item),
                              leading: FaIcon(
                                item.icon,
                                color: theme.colorScheme.onPrimary,
                              ),
                              title: Text(
                                item.title,
                                style: theme.textTheme.displayMedium!.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
            ),
          ),
          WillPopScope(
            onWillPop: () async {
              if (drawerSpecs.isDrawerOpen) {
                ref.read(drawerProvider.notifier).closeDrawer();
                return false;
              } else {
                return true;
              }
            },
            child: GestureDetector(
              onTap: () {
                ref.read(drawerProvider.notifier).closeDrawer();
              },
              child: AnimatedContainer(
                transform: Matrix4.translationValues(
                    drawerSpecs.xOffset, drawerSpecs.yOffset, 0)
                  ..scale(drawerSpecs.scaleFactor),
                duration: const Duration(milliseconds: 350),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(drawerSpecs.isDrawerOpen ? 25 : 0),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary,
                      blurRadius: 3,
                      offset: const Offset(-15, 15),
                    ),
                    BoxShadow(
                      color: theme.colorScheme.primary,
                      blurRadius: 2,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                curve: Curves.easeIn,
                child: AbsorbPointer(
                  absorbing: drawerSpecs.isDrawerOpen,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        drawerSpecs.isDrawerOpen ? 25 : 0),
                    child: getDrawerPage(),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.settings:
        return const SettingsScreen();

      case DrawerItems.addTx:
        return const NewTransactionScreen();
      case DrawerItems.myTx:
        return const TransactionDetailsScreen();
      case DrawerItems.reminders:
        return const CreateReminderScreen();
      case DrawerItems.categories:
        return const CategoryScreen();
      case DrawerItems.accounts:
        return const AccountsScreen();

      case DrawerItems.home:
      default:
        return HomeScreen(
          onSelectedItem: onSelectedItem,
        );
    }
  }
}
