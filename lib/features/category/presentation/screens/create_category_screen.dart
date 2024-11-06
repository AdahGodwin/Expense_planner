import 'package:expense_manager/features/category/presentation/widgets/icon_list.dart';
import 'package:expense_manager/shared/providers/filter_provider.dart';
import 'package:expense_manager/shared/components/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  static const routeName = "/create-category";
  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  Transaction transactionValue = Transaction.expense;

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
                      _buildRadio(Transaction.expense, "Expense"),
                      _buildRadio(Transaction.income, "Income"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconList(
                    transactionValue: transactionValue,
                  ),
                  const SizedBox(height: 15),
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
            icons: const SizedBox(width: 10),
            navigationIcon: FontAwesomeIcons.arrowLeft,
            showTabs: false,
            popWindow: true,
          ),
        ],
      ),
    );
  }

  Widget _buildRadio(Transaction transaction, String name) {
    return Flexible(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 1,
        title: Text(
          name,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        leading: Radio<Transaction>(
          value: transaction,
          groupValue: transactionValue,
          onChanged: (Transaction? value) {
            setState(() {
              transactionValue = value!;
            });
          },
        ),
      ),
    );
  }
}
