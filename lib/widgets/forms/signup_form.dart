import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/expense_provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Map<String, dynamic> expense = {
    "title": "",
    "amount": 0.0,
    "date": DateTime.now(),
    "paymentMethod": "",
    "key": ""
  };

  TextEditingController dateCtrl = TextEditingController();

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    Provider.of<Expenses>(context, listen: false).addExpense(
      expense["title"],
      double.parse(expense["amount"].toString().replaceAll(",", "")),
      expense["date"],
      expense["paymentMethod"],
      expense["key"],
    );
    _formKey.currentState?.reset();
    dateCtrl.clear();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Added Succesfully!",
        ),
        duration: Duration(
          milliseconds: 300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
      child: Form(
        key: _formKey,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.1,
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Title",
                        labelStyle:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        expense["title"] = newValue;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Title",
                        labelStyle:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        expense["title"] = newValue;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Title",
                        labelStyle:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        expense["title"] = newValue;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: "Title",
                        labelStyle:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        expense["title"] = newValue;
                      },
                    ),
                  ),
                ]),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    _submit(context);
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
