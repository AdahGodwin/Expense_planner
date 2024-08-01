import 'package:expense_manager/widgets/menu_button.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final Widget titleWidget;
  final double height;
  final Widget icons;
  final IconData navigationIcon;
  final bool showTabs;
  const Header({
    required this.titleWidget,
    required this.height,
    required this.icons,
    required this.navigationIcon,
    required this.showTabs,
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool income = false;
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

    return Container(
      height: (mediaQuery.size.height - mediaQuery.padding.top) * widget.height,
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
      padding: const EdgeInsets.only(left: 15, top: 25, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuButton(
                icon: widget.navigationIcon,
              ),
              widget.titleWidget,
              widget.icons,
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          if (widget.showTabs)
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
    );
  }
}
