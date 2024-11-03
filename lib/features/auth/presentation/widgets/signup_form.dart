import 'package:expense_manager/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> authDetails = {
    "firstname": "",
    "lastname": "",
    "email": "",
  };
  Widget textFieldWidget({
    required String labelText,
    required String authValue,
    required String hintText,
    Icon? icon,
  }) {
    return SizedBox(
      height: 100,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(55),
            ),
            labelText: labelText,
            suffixIcon: icon,
            labelStyle: const TextStyle(
              fontSize: 17,
            ),
            hintText: hintText),
        validator: (value) {
          if (value!.isEmpty) {
            return '$labelText is required';
          }
          return null;
        },
        onSaved: (newValue) {
          authDetails[authValue] = newValue;
        },
      ),
    );
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    ref.read(authProvider.notifier).addUserDetails(
          authDetails["firstname"],
          authDetails["lastname"],
          authDetails["email"],
        );
    Navigator.of(context).pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
      child: Form(
        key: _formKey,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.6,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      textFieldWidget(
                          labelText: "First Name",
                          authValue: "firstname",
                          hintText: "ex: John",
                          icon: const Icon(Icons.person_2)),
                      textFieldWidget(
                          labelText: "Last Name",
                          authValue: "lastname",
                          hintText: "ex: Doe",
                          icon: const Icon(Icons.person)),
                      textFieldWidget(
                        labelText: "Email",
                        authValue: "email",
                        hintText: "ex: doej@gmail.com",
                        icon: const Icon(Icons.email),
                      ),
                    ]),
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    _submit(context);
                  },
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
