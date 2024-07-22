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
    bool income = false;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.17,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: const ReminderForm(),
            ),
          ),
          Container(
            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.15,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                  begin: const Alignment(-1, -1),
                  end: const Alignment(1, 1),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                )),
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                      ),
                      onPressed: widget.openDrawer,
                      color: theme.colorScheme.onPrimary,
                    ),
                    Text(
                      "Create Reminder",
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            income = false;
                          }),
                          child: Text(
                            "EXPENSES",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        if (income == false) divider()
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            income = true;
                          }),
                          child: Text(
                            "INCOME",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        if (income == true) divider()
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
