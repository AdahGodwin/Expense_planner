import 'dart:io';

// import 'package:expense_manager/providers/theme.dart';

import 'package:expense_manager/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/auth_provider.dart';
import 'user_image_picker.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;

  const SettingsScreen({this.openDrawer, this.isDrawerOpen, super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  File? _userImageFile;

  AuthDetails? _user;
  bool _isInit = true;
  @override
  void initState() {
    super.initState();
    if (_isInit == true) {
      _user = ref.read(authProvider);
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
    ref.read(authProvider.notifier).updateUserDetails(
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

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                                onPressed: () {},
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
