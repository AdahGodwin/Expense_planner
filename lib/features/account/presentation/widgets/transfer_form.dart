import 'package:expense_manager/features/account/data/models/account.dart';
import 'package:expense_manager/features/account/data/models/enums.dart';
import 'package:expense_manager/features/account/presentation/widgets/select_Account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransferForm extends StatelessWidget {
  final VoidCallback selectDate;
  final VoidCallback submitForm;
  final Function(TransactionType transferType, Account account)
      onAccountSelected;
  final TextEditingController dateCtrl;
  final TextEditingController commentCtrl;
  final TextEditingController amountCtrl;
  final String transferFromAccount;
  final String transferToAccount;
  const TransferForm({
    super.key,
    required this.selectDate,
    required this.submitForm,
    required this.onAccountSelected,
    required this.dateCtrl,
    required this.commentCtrl,
    required this.amountCtrl,
    required this.transferFromAccount,
    required this.transferToAccount,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transfer From Account",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.grey),
        ),
        SelectAccount(
          transactionType: TransactionType.debit,
          onAccountSelected: onAccountSelected,
          selectedAccountName: transferFromAccount,
        ),
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
        SelectAccount(
          transactionType: TransactionType.credit,
          onAccountSelected: onAccountSelected,
          selectedAccountName: transferToAccount,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 180,
              child: TextFormField(
                controller: amountCtrl,
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
        const SizedBox(height: 30),
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
                onTap: selectDate,
              ),
            ),
            IconButton(
              onPressed: selectDate,
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
          controller: commentCtrl,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Comment is required';
            }
            return null;
          },
          decoration: InputDecoration(
            label: const Text(
              "Comment",
            ),
            labelStyle:
                theme.textTheme.displaySmall!.copyWith(color: Colors.grey),
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
    );
  }
}
