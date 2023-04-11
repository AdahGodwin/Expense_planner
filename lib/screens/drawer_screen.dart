import "package:expense_planner/models/configurations.dart";
import "package:expense_planner/screens/charts_screen.dart";
import "package:expense_planner/screens/home_screen.dart";
import "package:expense_planner/screens/income_details_screen.dart";
import "package:expense_planner/screens/new_transaction_screen.dart";
import 'package:expense_planner/screens/settings_screen/settings_screen.dart';
import "package:expense_planner/screens/welcome_screen.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../providers/auth_provider.dart";
import "expense_details_screen.dart";

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  DrawerItem item = DrawerItems.home;
  void onSelectedItem(item) {
    setState(() {
      this.item = item;
      Future.delayed(
        const Duration(milliseconds: 150),
        () {
          closeDrawer();
        },
      );
    });
  }

  void openDrawer() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      Future.delayed(const Duration(milliseconds: 180), () {
        setState(() {
          xOffset = 230;
          yOffset = 120;
          scaleFactor = 0.7;
          isDrawerOpen = true;
        });
      });
    } else {
      setState(() {
        xOffset = 230;
        yOffset = 120;
        scaleFactor = 0.7;
        isDrawerOpen = true;
      });
    }
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthDetails? user = Provider.of<Auth>(context).getUser;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 25),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: user?.imageFile != null ? FileImage(user!.imageFile!) : null,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        Text(user?.firstname ?? ""),
                        Text(user?.email ?? ""),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Column(
                  children: DrawerItems.all
                      .map((item) => ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            onTap: () => onSelectedItem(item),
                            leading: Icon(
                              item.icon,
                              color: Colors.white,
                            ),
                            title: Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => onSelectedItem(DrawerItems.settings),
                      child: const Text(
                        "Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        WillPopScope(
          onWillPop: () async {
            if (isDrawerOpen) {
              closeDrawer();
              return false;
            } else {
              return true;
            }
          },
          child: GestureDetector(
            onTap: closeDrawer,
            child: AnimatedContainer(
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeIn,
              child: AbsorbPointer(
                absorbing: isDrawerOpen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 25 : 0),
                  child: getDrawerPage(),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.settings:
        return SettingsScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
        );
      case DrawerItems.charts:
        return ChartScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
        );
      case DrawerItems.expenseDetails:
        return ExpenseDetailsScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
        );
      case DrawerItems.incomeDetails:
        return IncomeDetailsScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
        );
      case DrawerItems.addTx:
        return NewTransactionScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
        );
      case DrawerItems.home:
      default:
        return HomeScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
          onSelectedItem: onSelectedItem,
        );
    }
  }
}
