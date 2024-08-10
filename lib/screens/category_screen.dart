import 'package:expense_manager/models/category.dart';
import 'package:expense_manager/providers/category_provider.dart';
import 'package:expense_manager/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Category> categories = ref.watch(categoryProvider);
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: categories[index].color,
                        radius: 30,
                        child: FaIcon(
                          categories[index].icon,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      FittedBox(child: Text(categories[index].name)),
                    ],
                  );
                },
                itemCount: categories.length,
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
