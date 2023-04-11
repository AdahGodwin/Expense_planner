import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import '../../providers/income_provider.dart';

class IncomeForm extends StatefulWidget {
  const IncomeForm({super.key});

  @override
  State<IncomeForm> createState() => _IncomeFormState();
}

class _IncomeFormState extends State<IncomeForm> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> income = {
    "title": "",
    "amount": 0.0,
    "date": DateTime.now(),
    "key": ""
  };

  TextEditingController dateCtrl = TextEditingController();

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    Provider.of<Income>(context, listen: false).addIncome(
      context,
      income["title"],
      double.parse(income["amount"].toString().replaceAll(",", "")),
      income["date"],
      income["key"],
    );
    _formKey.currentState?.reset();
    dateCtrl.clear();
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
                hintText: "Eg: Salary, Business, etc",
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
                income["title"] = newValue;
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
                labelStyle: const TextStyle(
                  fontSize: 20,
                ),
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
                income["amount"] = newValue;
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
                income["date"] = selectedDate;
                income["key"] = DateFormat("E dd/MM/yy").format(selectedDate);
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
                  "Add Income",
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
