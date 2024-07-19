import 'package:expense_manager/widgets/forms/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = "/signup";
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: (mediaQuery.size.height) * 0.2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(99, 159, 132, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to EPx",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Fill in the form and login your account",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: (mediaQuery.size.height) * 0.8,
                child: const SignUpForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
