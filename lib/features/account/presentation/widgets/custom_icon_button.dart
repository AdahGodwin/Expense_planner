import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final String routeName;
  final IconData icon;
  const CustomIconButton(
      {super.key,
      required this.text,
      required this.routeName,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(routeName),
          child: Card(
            color: theme.colorScheme.primary,
            elevation: 3,
            margin: const EdgeInsets.only(
              bottom: 5,
              top: 30,
            ),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FaIcon(
                icon,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
