import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key, this.openDrawer,this.isDrawerOpen});
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDrawerOpen! ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: openDrawer,
          color: Colors.white,
        ),
      ),
      body: Placeholder(),
    );
  }
}