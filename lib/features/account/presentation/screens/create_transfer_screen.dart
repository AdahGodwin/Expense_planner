import 'package:expense_manager/features/account/data/models/account.dart';
import 'package:expense_manager/features/account/data/models/enums.dart';
import 'package:expense_manager/features/account/presentation/providers/transfer_provider.dart';
import 'package:expense_manager/features/account/presentation/widgets/transfer_form.dart';
import 'package:flutter/material.dart';
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
  TextEditingController amountCtrl = TextEditingController();
  TextEditingController commentCtrl = TextEditingController();
  String transferFromAccount = "Select";
  String transferToAccount = "Select";

  Map<String, dynamic> transfer = {
    "fromAccountId": "",
    "toAccountId": "",
    "date": DateTime.now(),
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
          milliseconds: 200,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        showCloseIcon: true,
      ),
    );
  }

  void setAccount(TransactionType transactionType, Account account) {
    setState(() {
      transactionType == TransactionType.debit
          ? (
              transfer["fromAccountId"] = account.id,
              transferFromAccount = account.name,
            )
          : (
              transferToAccount = account.name,
              transfer["toAccountId"] = account.id
            );
    });
    Navigator.of(context).pop();
  }

  void submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (transferFromAccount == "Select" || transferToAccount == "Select") {
      showSnackbar(
          "please select account Info", Theme.of(context).colorScheme.error);
      return;
    }
    if (transferFromAccount == transferToAccount) {
      showSnackbar("please select different accounts",
          Theme.of(context).colorScheme.error);
      return;
    }

    ref.read(transferProvider.notifier).createTransfer(
          fromAccountId: transfer["fromAccountId"],
          toAccountId: transfer["toAccountId"],
          amount: double.parse(amountCtrl.text),
          date: transfer["date"],
          description: commentCtrl.text,
          key: transfer["key"],
        );

    dateCtrl.clear();
    amountCtrl.clear();
    commentCtrl.clear();
    setState(() {
      transfer["fromAccountId"] = "";
      transfer["toAccountId"] = "";
      transferFromAccount = "Select";
      transferToAccount = "Select";
    });

    showSnackbar("Added Successfully", Theme.of(context).colorScheme.primary);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: (mediaQuery.size.height - mediaQuery.padding.top) * .1,
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
                child: Form(
                    key: _formKey,
                    child: TransferForm(
                      amountCtrl: amountCtrl,
                      commentCtrl: commentCtrl,
                      dateCtrl: dateCtrl,
                      selectDate: _selectDate,
                      submitForm: submitForm,
                      onAccountSelected: setAccount,
                      transferFromAccount: transferFromAccount,
                      transferToAccount: transferToAccount,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
