import 'package:expense_manager/models/account.dart';
import 'package:expense_manager/models/category.dart';
import 'package:expense_manager/providers/account_provider.dart';
import 'package:expense_manager/providers/category_provider.dart';
import 'package:expense_manager/providers/expense_provider.dart';
import 'package:expense_manager/providers/filter_provider.dart';
import 'package:expense_manager/providers/income_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionFormScreen extends ConsumerStatefulWidget {
  const TransactionFormScreen({super.key});

  @override
  ConsumerState<TransactionFormScreen> createState() =>
      _TransactionFormScreenState();
}

class _TransactionFormScreenState extends ConsumerState<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();
  TextEditingController dateCtrl = TextEditingController(text: "Select date");

  String accountName = "none";

  Map<String, dynamic> transactionDetails = {
    "amount": 0.0,
    "accountId": "",
    "description": "",
    "date": DateTime.now(),
    "category": "",
    "key": "",
    "budgetId": "001",
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
    transactionDetails["date"] = selectedDate;
    transactionDetails["key"] = DateFormat("E dd/MM/yy").format(selectedDate);
  }

  submitForm(Transaction transactionType) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    if (transactionType == Transaction.expense) {
      ref.read(expenseProvider.notifier).addExpense(
            description: transactionDetails["description"],
            amount: double.parse(transactionDetails["amount"]),
            date: transactionDetails["date"],
            categoryName: transactionDetails["category"],
            key: transactionDetails["key"],
            budgetId: transactionDetails["budgetId"],
            accountId: transactionDetails["accountId"],
          );
    } else {
      ref.read(incomeProvider.notifier).addIncome(
            description: transactionDetails["description"],
            amount: double.parse(transactionDetails["amount"]),
            date: transactionDetails["date"],
            categoryName: transactionDetails["category"],
            key: transactionDetails["key"],
            budgetId: transactionDetails["budgetId"],
            accountId: transactionDetails["accountId"],
          );
    }
    _formKey.currentState?.reset();
    dateCtrl.clear();
    setState(() {
      transactionDetails["category"] = "";
      accountName = "none";
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 5,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
        content: Text(
          "Added Succesfully!",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white),
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        showCloseIcon: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Transaction transactionType = ref.watch(filterProvider);
    List<Category> categories = ref
        .watch(categoryProvider)
        .where((category) => category.type == transactionType)
        .toList();

    ThemeData theme = Theme.of(context);
    List<Account> accounts = ref.watch(accountProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textFieldWidget(label: "Amount(NGN)", value: "amount"),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account (optional)",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                ),
                child: Text(accountName),
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
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
                                  accountName = account.name;
                                  transactionDetails['accountId'] = account.id;
                                });
                                Navigator.of(context).pop();
                              },
                            ))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Categories",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    thickness: 3.0,
                    radius: const Radius.circular(8.0),
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) => Column(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: categories[index].color.withOpacity(
                                  transactionDetails["category"] ==
                                          categories[index].name
                                      ? 1.0
                                      : 0.0),
                              border: transactionDetails["category"] ==
                                      categories[index].name
                                  ? Border.all(color: Colors.black54, width: 2)
                                  : null,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  transactionDetails["category"] =
                                      categories[index].name;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: categories[index].color,
                                radius: 30,
                                child: FaIcon(
                                  categories[index].icon,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          FittedBox(child: Text(categories[index].name)),
                        ],
                      ),
                      itemCount: categories.length,
                    ),
                  ),
                ),
              ],
            ),
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
            height: 5,
          ),
          _textFieldWidget(label: "Comment", value: "description"),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                submitForm(transactionType);
              },
              child: Text(
                "Add ${transactionType == Transaction.expense ? 'Expense' : "Income"}",
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldWidget({required String label, required String value}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 18, color: Colors.grey),
      ),
      keyboardType:
          label == "Amount" ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onSaved: (newValue) {
        transactionDetails[value] = newValue;
      },
    );
  }
}
