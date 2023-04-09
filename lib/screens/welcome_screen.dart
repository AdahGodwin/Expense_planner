import "package:expense_planner/screens/signup_screen.dart";
import "package:flutter/material.dart";

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/welcome";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 232.0, bottom: 102),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("EPx", style: TextStyle(fontSize: 80, color: Theme.of(context).primaryColorLight),),
            Text("Your Personal Expense Planner", style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColorLight),),
            const Spacer(),
            SizedBox(
              width: 300,
              height: 50, 
              child: ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  
                  shape: const StadiumBorder(),
                ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
              },
              child: const Text("Get Started", style: TextStyle(fontSize: 20),),
            ))
          ]),
        ),
      ),
    );
  }
}
