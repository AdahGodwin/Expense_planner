import "package:expense_manager/screens/signup_screen.dart";
import "package:flutter/material.dart";

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/welcome";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "EPx",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromRGBO(99, 159, 132, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset("assets/images/money.png"),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to \nEPx",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Manage your Expenses using the EPx app",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(99, 159, 132, 1)),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
