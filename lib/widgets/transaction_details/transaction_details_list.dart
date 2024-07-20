import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionDetailsList extends StatelessWidget {
  final DateTime? selectedMonth;
  const TransactionDetailsList({this.selectedMonth, super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
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
        SizedBox(
          height: 25,
        ),
        Text(
          "Total: \$3000",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "July 23, 2024",
              style: TextStyle(color: Colors.grey),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20,
                child: FaIcon(
                  FontAwesomeIcons.pizzaSlice,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text("Food"),
              subtitle: Text(
                "A slice of Pizza",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text("\$20", style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20,
                child: FaIcon(
                  FontAwesomeIcons.pizzaSlice,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text("Food"),
              subtitle: Text(
                "A slice of Pizza",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text("\$20", style: TextStyle(fontSize: 16)),
            ),
            Text(
              "July 24, 2024",
              style: TextStyle(color: Colors.grey),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 20,
                child: FaIcon(
                  FontAwesomeIcons.bus,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text("Transport"),
              subtitle: Text(
                "Keke to First gate",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text("\$30", style: TextStyle(fontSize: 16)),
            ),
          ],
        )
      ],
    );
  }
}
