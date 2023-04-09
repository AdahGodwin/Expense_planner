import 'package:expense_planner/blocs/theme.dart';
import 'package:expense_planner/providers/expense_provider.dart';
import 'package:expense_planner/providers/income_provider.dart';
import 'package:expense_planner/screens/drawer_screen.dart';
import 'package:expense_planner/screens/signup_screen.dart';
import 'package:expense_planner/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (context) => ThemeChanger(
            ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,

        errorColor: Colors.red,
        fontFamily: 'Quicksand',
      ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Expenses(),
        ),
        ChangeNotifierProvider(
          create: (context) => Income(),
        )
      ],
      child: const MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: theme.getTheme(),
      home: const DrawerScreen(),
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
      body: buildDrawer(),
    );
  }
}
