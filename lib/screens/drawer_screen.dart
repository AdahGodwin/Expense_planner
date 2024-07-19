import "package:expense_manager/models/configurations.dart";
import "package:expense_manager/screens/charts_screen.dart";
import "package:expense_manager/screens/transaction_details_screen.dart";
import "package:expense_manager/screens/home_screen.dart";
import "package:expense_manager/screens/new_transaction_screen.dart";
import 'package:expense_manager/screens/settings_screen/settings_screen.dart';
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:provider/provider.dart";

import "../providers/auth_provider.dart";

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
          xOffset = 270;
          yOffset = 90;
          scaleFactor = 0.85;
          isDrawerOpen = true;
        });
      });
    } else {
      setState(() {
        xOffset = 270;
        yOffset = 90;
        scaleFactor = 0.85;
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(8, 195, 111, 1),
              Color.fromRGBO(5, 180, 128, 1),
            ],
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
          ),
          color: Color.fromRGBO(99, 159, 132, 1),
        ),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: user?.imageFile != null
                            ? FileImage(user!.imageFile!)
                            : null,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                user?.firstname ?? "John",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                user?.lastname ?? " Doe",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Text(
                            user?.email ?? "johndoe@gmail.com",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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
                    height: MediaQuery.of(context).size.height * 0.1,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 25 : 0),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 3,
                      offset: const Offset(-15, 15),
                    ),
                    BoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
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
      ),
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

      case DrawerItems.addTx:
        return NewTransactionScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
        );
      case DrawerItems.myTx:
        return TransactionDetailsScreen(
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
