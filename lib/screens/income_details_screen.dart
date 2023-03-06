import 'package:flutter/material.dart';

class IncomeDetailsScreen extends StatelessWidget {
  const IncomeDetailsScreen({super.key, this.openDrawer, this.isDrawerOpen});
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:isDrawerOpen! ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: openDrawer,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Income", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              TextButton(onPressed: () {}, child: const Text("Select Month", style: TextStyle(
                fontSize: 17,
                ),),),
            ],
          ),
          Placeholder(),
        ]),
      ),
    );
  }
}
