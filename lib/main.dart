import 'package:expense_planner/screens/drawer_screen.dart';
import 'package:expense_planner/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          // errorColor: Colors.red,
          fontFamily: 'Quicksand',
          
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // String titleInput;
  // String amountInput;
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Widget buildDrawer() {
    return const DrawerScreen();
       
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:buildDrawer(),
      
    );
  
  }
}
