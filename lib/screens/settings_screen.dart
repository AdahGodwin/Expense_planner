import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:expense_planner/blocs/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;

  const SettingsScreen({this.openDrawer, this.isDrawerOpen, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> authDetails = {
    "firstname": "",
    "lastname": "",
    "email": "",
    "password": "",
  };

  TextEditingController dateCtrl = TextEditingController();

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    // Provider.of<Auth>(context, listen: false).addUserDetails(
    //   authDetails["firstname"],
    //   authDetails["lastname"],
    //   authDetails["email"],
    //   authDetails["password"],
    // );
    _formKey.currentState?.reset();
    dateCtrl.clear();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Succesful!",
        ),
        duration: Duration(
          milliseconds: 300,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.isDrawerOpen!
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: widget.openDrawer,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save,
              size: 30,
            ),
          ),
        ],
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: (mediaQuery.size.height - AppBar().preferredSize.height),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: 15,
            ),
            child: Form(
              key: _formKey,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.2,
                      child: CircleAvatar(
                        radius: 65,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.8,
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
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
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
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "Password",
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
                                authDetails["password"] = newValue;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                CurrencyTextInputFormatter(
                                    symbol: " ", enableNegative: false),
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                prefixText:
                                    "${NumberFormat.simpleCurrency(name: "NGN").currencySymbol} ",
                                labelText: "Current Balance",
                                labelStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                //  expense["amount"] = newValue;
                              },
                            ),
                          ),
                          TextButton(onPressed: () {
                            Provider.of<ThemeChanger>(context, listen: false).setTheme(ThemeData.dark());
                          }, child: Text("Dark"),),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
