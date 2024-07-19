import 'dart:io';

import 'package:expense_manager/providers/theme.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import 'user_image_picker.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;

  const SettingsScreen({this.openDrawer, this.isDrawerOpen, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File? _userImageFile;

  late ThemeData? _currentTheme;
  AuthDetails? _user;
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit == true) {
      _currentTheme = Provider.of<ThemeChanger>(context).getTheme();
      _user = Provider.of<Auth>(context).getUser;
    }
    _isInit = false;
  }

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> authDetails = {
    "firstname": "",
    "lastname": "",
    "email": "",
    "password": "",
    "balance": 0.0,
  };

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    Provider.of<Auth>(context, listen: false).updateUserDetails(
      authDetails["firstname"],
      authDetails["lastname"],
      authDetails["email"],
      _userImageFile,
      double.parse(authDetails["balance"].toString().replaceAll(",", "")),
    );
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

  void _pickImage(File image) {
    _userImageFile = image;
  }

  bool edited = true;
  final Map<String, ThemeData> _colors = {
    "Dark": ThemeData.dark(),
    "blue": ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Quicksand',
    ),
    "green": ThemeData(
      primarySwatch: Colors.green,
      fontFamily: 'Quicksand',
    ),
    "Teal": ThemeData(
      primarySwatch: Colors.teal,
      fontFamily: 'Quicksand',
    ),
    "Red": ThemeData(
      primarySwatch: Colors.red,
      fontFamily: 'Quicksand',
    ),
    "Orange": ThemeData(
      primarySwatch: Colors.orange,
      fontFamily: 'Quicksand',
    ),
  };

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
            onPressed: () {
              _submit(context);
            },
            icon: const Icon(
              Icons.save,
              size: 30,
            ),
          ),
        ],
        title: const Text("Profile"),
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
                      height: constraints.maxHeight * 0.25,
                      child: Column(
                        children: [
                          UserImagePicker(_pickImage, _user?.imageFile),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              initialValue: _user?.firstname,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "First Name",
                                labelStyle: const TextStyle(
                                  fontSize: 20,
                                ),
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
                              initialValue: _user?.lastname,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "Last Name",
                                labelStyle: const TextStyle(
                                  fontSize: 20,
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
                              initialValue: _user?.email,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "Email",
                                labelStyle: const TextStyle(
                                  fontSize: 20,
                                ),
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
                              initialValue: _user?.balance.toString(),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                prefixText:
                                    "${NumberFormat.simpleCurrency(name: "NGN").currencySymbol} ",
                                labelText: "Current Balance",
                                labelStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                authDetails["balance"] = newValue;
                              },
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        children: _colors.keys.map((key) {
                                          return ListTile(
                                            leading: CircleAvatar(
                                              radius: 10,
                                              backgroundColor:
                                                  _colors[key]?.primaryColor,
                                            ),
                                            onTap: () {
                                              Provider.of<ThemeChanger>(
                                                context,
                                                listen: false,
                                              ).setTheme(key);

                                              Navigator.of(context).pop();
                                            },
                                            title: Text("$key Theme"),
                                          );
                                        }).toList(),
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  "Change Theme",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
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
