import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/expense_provider.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  @override
  bool get wantKeepAlive => true;
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
        behavior: SnackBarBehavior.floating,

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(fontSize: 20),
                suffixIcon: Icon(
                  Icons.category_outlined,
                ),
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
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                CurrencyTextInputFormatter(symbol: " ", enableNegative: false),
              ],
              decoration: InputDecoration(
                prefixText:
                    "${NumberFormat.simpleCurrency(name: "NGN").currencySymbol} ",
                labelText: "Amount",
                labelStyle: const TextStyle(fontSize: 20),
                suffixIcon: const Icon(
                  Icons.monetization_on_sharp,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is required';
                }
                return null;
              },
              onSaved: (newValue) {
                expense["amount"] = newValue;
              },
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is required';
                }
                return null;
              },
              controller: dateCtrl,
              onTap: () async {
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
                expense["date"] = selectedDate;
                expense["key"] = DateFormat("E dd/MM/yy").format(selectedDate);
                },
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Date",
                labelStyle: TextStyle(fontSize: 20),
                suffixIcon: Icon(
                  Icons.calendar_month,
                ),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Payment Method",
                hintText: "Cash, Transfer, card, etc",
                labelStyle: TextStyle(fontSize: 20),
                suffixIcon: Icon(
                  Icons.money,
                ),
              ),
              onSaved: (newValue) {
                expense["paymentMethod"] = newValue;
              },
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
                  "Add Expense",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
