import 'package:expense_planner/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> authDetails = {
    "firstname": "",
    "lastname": "",
    "email": "",
  };

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    Provider.of<Auth>(context, listen: false).addUserDetails(
      authDetails["firstname"],
      authDetails["lastname"],
      authDetails["email"],
    );
    Navigator.of(context).pushReplacementNamed("/home");
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
                            labelText: "First Name",
                            labelStyle: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            authDetails["firstname"] = newValue;
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
                            labelText: "Last Name",
                            labelStyle: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            authDetails["lastname"] = newValue;
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
                            labelText: "Email",
                            labelStyle: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            authDetails["email"] = newValue;
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
