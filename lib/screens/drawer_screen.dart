import "package:expense_planner/models/configurations.dart";
import "package:expense_planner/screens/home_screen.dart";
import "package:expense_planner/screens/new_transaction_screen.dart";
import "package:flutter/material.dart";

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
      // closeDrawer();
    });
  }

  void openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 120;
      scaleFactor = 0.7;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  Color primaryGreen = const Color(0xff416d6d);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.only(top: 30, left: 25),
          color: primaryGreen,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text("Godwin Adah"),
                      Text("adahgodwin224@gmail.com")
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
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
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
              duration: const Duration(milliseconds: 300),
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
        );
    }
  }
}
