import 'package:expense_manager/shared/categorydata.dart';
import 'package:expense_manager/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.23,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 20,
                  children: [
                    ...Categories.categoryNames.map((String name) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Categories.getIconForCategory(name).color,
                            radius: 30,
                            child: FaIcon(
                              Categories.getIconForCategory(name).icon,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Text(name),
                        ],
                      );
                    }),
                    const Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 30,
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text("Create"),
                      ],
                    ),
                  ],
                ),
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
