import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransferList extends StatelessWidget {
  const TransferList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.grey,
                size: 20,
              ),
              Text(
                "July 2023",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.8,
            child: ListView.builder(
              itemBuilder: (context, index) => const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "June 20 2024",
                    style: TextStyle(color: Colors.grey),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.arrowRotateRight,
                      color: Colors.black54,
                      size: 20,
                    ),
                    title: Text("Card"),
                    subtitle: Text(
                      "Transfer from Savings",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing:
                        Text("\$${"100"}", style: TextStyle(fontSize: 16)),
                  ),
                  Text(
                    "June 20 2024",
                    style: TextStyle(color: Colors.grey),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.arrowRotateRight,
                      color: Colors.black54,
                      size: 20,
                    ),
                    title: Text("Card"),
                    subtitle: Text(
                      "Transfer from Paypal",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing:
                        Text("\$${"200"}", style: TextStyle(fontSize: 16)),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.arrowRotateRight,
                      color: Colors.black54,
                      size: 20,
                    ),
                    title: Text("Card"),
                    subtitle: Text(
                      "Transfer from Cash account",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing:
                        Text("\$${"200"}", style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              itemCount: 3,
            ),
          )
        ],
      );
    });
  }
}
