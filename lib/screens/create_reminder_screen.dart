import 'package:expense_manager/widgets/header_widget.dart';
import 'package:expense_manager/widgets/reminder_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateReminderScreen extends StatefulWidget {
  const CreateReminderScreen({super.key, this.openDrawer, this.isDrawerOpen});
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;

  @override
  State<CreateReminderScreen> createState() => _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateReminderScreen> {
  Widget divider() {
    return SizedBox(
      width: 100,
      child: Divider(
        color: Theme.of(context).colorScheme.onPrimary,
        height: 2,
        thickness: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.19,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: const ReminderForm(),
            ),
          ),
          Header(
            navigationIcon: FontAwesomeIcons.arrowLeft,
            titleWidget: Text(
              "Create Reminder",
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            height: 0.18,
            icons: const SizedBox(
              width: 10,
            ),
          ),
        ],
      ),
    );
  }
}
