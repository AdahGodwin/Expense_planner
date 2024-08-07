import 'package:expense_manager/shared/categorydata.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionFormScreen extends StatelessWidget {
  const TransactionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    const dateStrings = ["Today", "Yesterday", "2 days ago"];
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textFieldWidget("Amount"),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "Main",
                style: TextStyle(
                  color: theme.colorScheme.primary,
                ),
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
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 20,
                  children: [
                    ...Category.categoryNames.take(7).map((String name) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.teal,
                            radius: 30,
                            child: FaIcon(
                              Category.getIconForCategory(name),
                              color: Colors.white,
                            ),
                          ),
                          Text(name),
                        ],
                      );
                    }),
                    const Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                        ),
                        Text("Other"),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Date",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(3, (index) {
                return SizedBox(
                  child: Column(
                    children: [
                      Text(
                        DateFormat("dd/MM").format(
                          DateTime.now().subtract(Duration(days: index)),
                        ),
                      ),
                      Text(
                        dateStrings[index],
                      ),
                    ],
                  ),
                );
              }),
              FaIcon(
                FontAwesomeIcons.calendarDays,
                color: theme.colorScheme.primary,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          _textFieldWidget("Comment"),
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
      ),
    );
  }
}

Widget _textFieldWidget(String label) {
  return TextFormField(
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 18, color: Colors.grey),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Field is required';
      }
      return null;
    },
  );
}
