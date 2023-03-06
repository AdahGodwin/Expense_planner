import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final VoidCallback? openDrawer;
  final bool? isDrawerOpen;
  const Summary({super.key, this.openDrawer, this.isDrawerOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).highlightColor,
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: openDrawer,
                  color: Colors.white,
                ),
              ),
              const Text(
                "TOTAL SPENT TODAY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
          const Text(
            "0.00",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).highlightColor,
                child: const Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Todays Income: 0.00",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
