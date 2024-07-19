import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionFormScreen extends StatelessWidget {
  const TransactionFormScreen({super.key});
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

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    const dateStrings = ["Today", "Yesterday", "2 days ago"];
    return SizedBox(
      height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textFieldWidget("Amount"),
          const SizedBox(
            height: 20,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "Main",
                style: TextStyle(
                  color: Color.fromRGBO(5, 180, 128, 1),
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
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ...List.generate(7, (index) {
                return const Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 30,
                      child: FaIcon(
                        FontAwesomeIcons.cartShopping,
                        color: Colors.white,
                      ),
                    ),
                    Text("Shopping"),
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
                  Text("Add"),
                ],
              )
            ],
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
                return Container(
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
              const FaIcon(
                FontAwesomeIcons.calendarDays,
                color: Color.fromRGBO(5, 180, 128, 1),
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
                backgroundColor: const Color.fromRGBO(8, 195, 111, 1),
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: const Text(
                "Add Expense",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
