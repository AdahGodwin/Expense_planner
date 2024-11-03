import 'package:expense_manager/features/category/data/models/category.dart';
import 'package:expense_manager/features/category/presentation/providers/category_provider.dart';
import 'package:expense_manager/shared/providers/filter_provider.dart';
import 'package:expense_manager/features/category/presentation/screens/create_category_screen.dart';
import 'package:expense_manager/shared/components/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Transaction transactionType = ref.watch(filterProvider);
    List<Category> categories = ref
        .watch(categoryProvider)
        .where((category) => category.type == transactionType)
        .toList();

    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.22,
              left: 5,
              right: 5,
              bottom: 10,
            ),
            child: Center(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                ),
                children: [
                  ...categories.map(
                    (category) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: category.color,
                            radius: 30,
                            child: FaIcon(
                              category.icon,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          FittedBox(child: Text(category.name)),
                        ],
                      );
                    },
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(CreateCategoryScreen.routeName);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 30,
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const Text("Add"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Header(
            titleWidget: Text(
              "Categories",
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            height: 0.2,
            icons: const SizedBox(
              width: 10,
            ),
            navigationIcon: FontAwesomeIcons.arrowLeft,
            showTabs: true,
          ),
        ],
      ),
    );
  }
}
