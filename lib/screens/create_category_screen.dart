import 'package:expense_manager/models/category.dart';
import 'package:expense_manager/providers/category_provider.dart';
import 'package:expense_manager/providers/filter_provider.dart';
import 'package:expense_manager/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateCategoryScreen extends ConsumerStatefulWidget {
  const CreateCategoryScreen({super.key});

  static const routeName = "/create-category";
  @override
  ConsumerState<CreateCategoryScreen> createState() =>
      _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends ConsumerState<CreateCategoryScreen> {
  Transaction transactionValue = Transaction.expense;

  @override
  Widget build(BuildContext context) {
    List<Category> categories = ref.watch(categoryProvider);

    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: (mediaQuery.size.height - mediaQuery.padding.top) * 0.15,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.brown,
                        child: FaIcon(
                          FontAwesomeIcons.paw,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 1,
                          title: Text(
                            'Expenses',
                            style: theme.textTheme.displaySmall,
                          ),
                          leading: Radio<Transaction>(
                            value: Transaction.expense,
                            groupValue: transactionValue,
                            onChanged: (Transaction? value) {
                              setState(() {
                                transactionValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          horizontalTitleGap: 1,
                          title: Text(
                            'Income',
                            style: theme.textTheme.displaySmall,
                          ),
                          leading: Radio<Transaction>(
                            value: Transaction.income,
                            groupValue: transactionValue,
                            onChanged: (Transaction? value) {
                              setState(() {
                                transactionValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                        ...categories.map((Category category) {
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
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      textStyle: theme.textTheme.displayMedium,
                    ),
                    child: const Text(
                      "Select Color",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.secondary),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Add",
                          style: theme.textTheme.displaySmall!
                              .copyWith(color: theme.colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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
            popWindow: true,
          ),
        ],
      ),
    );
  }
}
