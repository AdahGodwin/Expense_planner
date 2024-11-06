import 'package:expense_manager/features/category/data/models/category.dart';
import 'package:expense_manager/features/category/presentation/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../shared/providers/filter_provider.dart';

class IconList extends ConsumerWidget {
  final Transaction transactionValue;
  const IconList({super.key, required this.transactionValue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Category> categories = ref.watch(categoryProvider);
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Text(
          "Icons",
          style: theme.textTheme.displaySmall!.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 20,
            children: [
              ...categories
                  .where(
                      (Category category) => category.type == transactionValue)
                  .map((category) {
                return CircleAvatar(
                  backgroundColor: category.color,
                  radius: 30,
                  child: FaIcon(
                    category.icon,
                    color: Colors.white,
                    size: 30,
                  ),
                );
              }),
              const CircleAvatar(
                backgroundColor: Colors.brown,
                radius: 30,
                child: FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
