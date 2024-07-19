import 'package:expense_manager/providers/auth_provider.dart';
import 'package:expense_manager/providers/theme.dart';
import 'package:expense_manager/providers/expense_provider.dart';
import 'package:expense_manager/providers/income_provider.dart';
import 'package:expense_manager/screens/drawer_screen.dart';
import 'package:expense_manager/screens/signup_screen.dart';
import 'package:expense_manager/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (context) => ThemeChanger(),
        ),
        ChangeNotifierProvider(
          create: (context) => Expenses(),
        ),
        ChangeNotifierProvider(
          create: (context) => Auth(),
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
    return Consumer2<ThemeChanger, Auth>(
        builder: (context, theme, user, child) {
      return FutureBuilder(
          future:
              Provider.of<ThemeChanger>(context, listen: false).getThemeData(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Personal Expenses',
                    home: Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    ),
                  )
                : MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Personal Expenses',
                    theme: theme.getTheme() ??
                        ThemeData(
                          colorScheme: ColorScheme.fromSeed(
                            seedColor: const Color.fromRGBO(99, 159, 132, 1),
                          ),
                          useMaterial3: true,
                          fontFamily: "Poppins",
                        ),
                    home: const DrawerScreen(),
                    // home: FutureBuilder(
                    //     future: Provider.of<Auth>(context).getUserDetails(),
                    //     builder: (context, snapshot) {
                    //       if (!snapshot.hasData) {
                    //         return const Scaffold(
                    //           body: Center(child: CircularProgressIndicator()),
                    //         );
                    //       }
                    //       if (user.getUser != null) {
                    //         return const DrawerScreen();
                    //       }
                    //       return const WelcomeScreen();
                    //     }),
                    routes: {
                      "/home": (context) => const DrawerScreen(),
                      SignUpScreen.routeName: (context) => const SignUpScreen(),
                      WelcomeScreen.routeName: (context) =>
                          const WelcomeScreen(),
                    },
                  );
          });
    });
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
