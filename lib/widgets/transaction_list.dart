import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<dynamic> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "EXPENSES",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "INCOME",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 400,
              child: Card(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Day",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Week",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Month",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Year",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Period",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        "Chart Goes here",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return const Card(
                      color: Colors.white,
                      elevation: 1,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 1,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Shopping",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "50%",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text("30000 \$"),
                              ],
                            )
                          ],
                        ),
                      ));
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
