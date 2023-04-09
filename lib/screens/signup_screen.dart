import 'package:expense_planner/widgets/forms/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = "/signup";
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: (mediaQuery.size.height) * 0.1,
               
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(85),
                  ),
                ),
                height: (mediaQuery.size.height) *
                    0.9,
                    child: const SignUpForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
