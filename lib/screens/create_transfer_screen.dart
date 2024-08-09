import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateTransfer extends StatelessWidget {
  const CreateTransfer({super.key});

  static const routeName = "/create-transfer";

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: (mediaQuery.size.height - mediaQuery.padding.top) * .13,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.secondary,
                ],
                begin: const Alignment(-1, -1),
                end: const Alignment(1, 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Create Transfer",
                  style: theme.textTheme.displayMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: (mediaQuery.size.height - mediaQuery.padding.top) * .87,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _inputSelectorWidget(
                      "Transfer from Account", "Opay", context),
                  _inputSelectorWidget("Transfer to account", "Card", context),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text(
                              "Transfer Amount",
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
                    height: 30,
                  ),
                  _inputSelectorWidget("Date", "August 5 2024", context),
                  TextFormField(
                    decoration: InputDecoration(
                      label: const Text(
                        "Comment",
                      ),
                      labelStyle: theme.textTheme.displaySmall!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  const Spacer(),
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
          )
        ],
      ),
    );
  }
}

Widget _inputSelectorWidget(String label, String value, BuildContext context) {
  ThemeData theme = Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: Colors.grey),
      ),
      Text(
        value,
        style: theme.textTheme.displayMedium!
            .copyWith(color: theme.colorScheme.primary),
      ),
      const SizedBox(
        height: 25,
      ),
    ],
  );
}
