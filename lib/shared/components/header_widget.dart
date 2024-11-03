import 'package:expense_manager/shared/providers/filter_provider.dart';
import 'package:expense_manager/shared/components/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends ConsumerWidget {
  final Widget titleWidget;
  final double height;
  final Widget icons;
  final IconData navigationIcon;
  final bool showTabs;
  final bool? popWindow;
  const Header({
    required this.titleWidget,
    required this.height,
    required this.icons,
    required this.navigationIcon,
    required this.showTabs,
    this.popWindow,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    MediaQueryData mediaQuery = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);
    Transaction transactionType = ref.watch(filterProvider);
    return Container(
      height: (mediaQuery.size.height - mediaQuery.padding.top) * height,
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
              popWindow == true
                  ? IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: FaIcon(
                        navigationIcon,
                        color: Colors.white,
                      ),
                    )
                  : MenuButton(
                      icon: navigationIcon,
                    ),
              titleWidget,
              icons,
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          if (showTabs)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => ref
                          .read(filterProvider.notifier)
                          .toggleTransaction(Transaction.expense),
                      child: Text(
                        "EXPENSES",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    if (transactionType == Transaction.expense) divider()
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => ref
                          .read(filterProvider.notifier)
                          .toggleTransaction(Transaction.income),
                      child: Text(
                        "INCOME",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    if (transactionType == Transaction.income) divider()
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
