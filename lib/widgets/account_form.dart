import 'package:expense_manager/models/category.dart';
import 'package:expense_manager/providers/category_provider.dart';
import 'package:expense_manager/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountFormScreen extends ConsumerStatefulWidget {
  const AccountFormScreen({super.key});

  @override
  ConsumerState<AccountFormScreen> createState() => _AccountFormScreenState();
}

class _AccountFormScreenState extends ConsumerState<AccountFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();

  Map<String, dynamic> accountDetails = {
    "balance": 0.0,
    "name": "",
    "category": "",
  };

  submitForm(Transaction transactionType) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    Transaction transactionType = ref.watch(filterProvider);
    List<Category> categories = ref
        .watch(categoryProvider)
        .where((category) => category.type == transactionType)
        .toList();

    ThemeData theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 180,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Amount is required';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    accountDetails["amount"] = newValue;
                  },
                  decoration: InputDecoration(
                    label: const Text(
                      "Balance",
                    ),
                    labelStyle: theme.textTheme.displaySmall!
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ),
              Text(
                "NGN",
                style: theme.textTheme.displayMedium!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _textFieldWidget(label: "Name", value: "name"),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Type",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    thickness: 3.0,
                    radius: const Radius.circular(8.0),
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) => Column(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: categories[index].color.withOpacity(
                                  accountDetails["category"] ==
                                          categories[index].name
                                      ? 1.0
                                      : 0.0),
                              border: accountDetails["category"] ==
                                      categories[index].name
                                  ? Border.all(color: Colors.black54, width: 2)
                                  : null,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  accountDetails["category"] =
                                      categories[index].name;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: categories[index].color,
                                radius: 30,
                                child: FaIcon(
                                  categories[index].icon,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          FittedBox(child: Text(categories[index].name)),
                        ],
                      ),
                      itemCount: categories.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                submitForm(transactionType);
              },
              child: Text(
                "Add Account",
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldWidget({required String label, required String value}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 18, color: Colors.grey),
      ),
      keyboardType:
          label == "Balance" ? TextInputType.number : TextInputType.text,
      inputFormatters: label == "Balance"
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : [],
      validator: (value) {
        if (value!.isEmpty) {
          return '$label is required';
        }
        return null;
      },
      onSaved: (newValue) {
        accountDetails[value] = newValue;
      },
    );
  }
}
