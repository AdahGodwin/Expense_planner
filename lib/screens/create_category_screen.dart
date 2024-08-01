import 'package:expense_manager/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Header(
            titleWidget: Text(
              "Create Category",
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            height: .13,
            icons: const SizedBox(
              width: 10,
            ),
            navigationIcon: FontAwesomeIcons.arrowLeft,
            showTabs: false,
          )
        ],
      ),
    );
  }
}
