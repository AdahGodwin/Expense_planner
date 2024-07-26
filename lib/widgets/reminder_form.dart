import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReminderForm extends StatefulWidget {
  const ReminderForm({super.key});

  @override
  State<ReminderForm> createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textFieldWidget("Reminder name"),
        _inputSelectorWidget("Reminder frequency", "Daily", context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Add Automatically"),
            Switch(
              activeTrackColor: theme.colorScheme.inversePrimary,
              inactiveTrackColor: Colors.grey,
              activeColor: theme.colorScheme.primary,
              inactiveThumbColor: Colors.white,
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        _inputSelectorWidget("Reminder Start date", "July 29, 2024", context),
        _inputSelectorWidget("Time", "10:00", context),
        _inputSelectorWidget("Reminder end date", "not selected", context),
        _inputSelectorWidget("Account", "Opay Card", context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category",
              style: theme.textTheme.displaySmall!.copyWith(color: Colors.grey),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                  radius: 20, child: FaIcon(FontAwesomeIcons.mugHot)),
              title: Text("Coffee"),
            )
          ],
        ),
        _textFieldWidget("Amount"),
        _textFieldWidget("Comment"),
        TextButton(
          onPressed: () {},
          child: Text(
            "Delete",
            style: theme.textTheme.displaySmall!
                .copyWith(color: Theme.of(context).colorScheme.error),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              shape: const StadiumBorder(),
            ),
            onPressed: () {},
            child: Text(
              "Add Expense",
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _textFieldWidget(String label) {
  return Column(
    children: [
      TextFormField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget _inputSelectorWidget(String label, String value, BuildContext context) {
  ThemeData theme = Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: Colors.grey),
      ),
      Text(
        value,
        style: theme.textTheme.displaySmall!
            .copyWith(color: theme.colorScheme.primary),
      ),
      const SizedBox(
        height: 25,
      ),
    ],
  );
}
