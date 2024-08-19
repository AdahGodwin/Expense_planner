import 'package:expense_manager/models/account.dart';
import 'package:expense_manager/providers/account_provider.dart';
import 'package:expense_manager/providers/transfer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CreateTransfer extends ConsumerStatefulWidget {
  const CreateTransfer({super.key});

  static const routeName = "/create-transfer";

  @override
  ConsumerState<CreateTransfer> createState() => _CreateTransferState();
}

class _CreateTransferState extends ConsumerState<CreateTransfer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtrl = TextEditingController();
  String transferFromAccountName = "Select";
  String transferToAccountName = "Select";

  Map<String, dynamic> transfer = {
    "fromAccountId": "",
    "toAccountId": "",
    "amount": 0.0,
    "date": DateTime.now(),
    "description": "",
    "key": "",
  };

  _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    if (selectedDate == null) {
      return;
    }
    dateCtrl.text = DateFormat.yMMMd().format(selectedDate);
    transfer["date"] = selectedDate;
    transfer["key"] = DateFormat("E dd/MM/yy").format(selectedDate);
  }

  showSnackbar(String text, Color color) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 5,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
        content: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white),
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        showCloseIcon: true,
      ),
    );
  }

  void submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (transferFromAccountName == "Select" ||
        transferToAccountName == "Select") {
      showSnackbar(
          "please select account Info", Theme.of(context).colorScheme.error);
      return;
    }
    if (transferFromAccountName == transferToAccountName) {
      showSnackbar("please select different accounts",
          Theme.of(context).colorScheme.error);
      return;
    }

    _formKey.currentState?.save();

    ref.read(transferProvider.notifier).createTransfer(
          fromAccountId: transfer["fromAccountId"],
          toAccountId: transfer["toAccountId"],
          amount: double.parse(transfer["amount"]),
          date: transfer["date"],
          description: transfer["description"],
          key: transfer["key"],
        );
    _formKey.currentState?.reset();
    dateCtrl.clear();
    setState(() {
      transfer["fromAccountId"] = "";
      transfer["toAccountId"] = "";
      transferFromAccountName = "Select";
      transferToAccountName = "Select";
    });

    showSnackbar("Added Successfully", Theme.of(context).colorScheme.primary);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: (mediaQuery.size.height - mediaQuery.padding.top) * .13,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                    begin: const Alignment(-1, -1),
                    end: const Alignment(1, 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Create Transfer",
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: (mediaQuery.size.height - mediaQuery.padding.top) * .87,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transfer From Account",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.grey),
                      ),
                      accountSelectorWidget("transferFrom"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Transfer to Account",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.grey),
                      ),
                      accountSelectorWidget("transferTo"),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Amount is required';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                transfer["amount"] = newValue;
                              },
                              decoration: InputDecoration(
                                label: const Text(
                                  "Transfer Amount",
                                ),
                                labelStyle: theme.textTheme.displaySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                          Text(
                            "NGN",
                            style: theme.textTheme.displayMedium!.copyWith(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Date is required';
                                }
                                return null;
                              },
                              controller: dateCtrl,
                              readOnly: true,
                              decoration: const InputDecoration(
                                hintText: "Date",
                                hintStyle: TextStyle(fontSize: 18),
                              ),
                              onTap: _selectDate,
                            ),
                          ),
                          IconButton(
                            onPressed: _selectDate,
                            icon: FaIcon(
                              FontAwesomeIcons.calendarDays,
                              color: theme.colorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Comment is required';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          transfer["description"] = newValue;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            "Comment",
                          ),
                          labelStyle: theme.textTheme.displaySmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.secondary),
                            onPressed: submitForm,
                            child: Text(
                              "Add",
                              style: theme.textTheme.displaySmall!.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget accountSelectorWidget(String accountName) {
    List<Account> accounts = ref.watch(accountProvider);
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
      ),
      child: Text(
        accountName == "transferFrom"
            ? transferFromAccountName
            : transferToAccountName,
        style: const TextStyle(fontSize: 18),
      ),
      onPressed: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => SimpleDialog(
              title: const Text("Select Account"),
              contentPadding: const EdgeInsets.all(32),
              children: [
                ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.plus,
                  ),
                  title: const Text("None"),
                  onTap: () {
                    setState(() {
                      accountName = "None";
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ...accounts.map((account) => ListTile(
                      leading: FaIcon(
                        account.category.icon,
                        color: account.category.color,
                      ),
                      title: Text(account.name),
                      onTap: () {
                        setState(() {
                          accountName == "transferFrom"
                              ? (
                                  transfer["fromAccountId"] = account.id,
                                  transferFromAccountName = account.name,
                                )
                              : (
                                  transferToAccountName = account.name,
                                  transfer["toAccountId"] = account.id
                                );
                        });
                        Navigator.of(context).pop();
                      },
                    ))
              ]),
        );
      },
    );
  }
}
