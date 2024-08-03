import 'package:expense_manager/providers/auth_provider.dart';
import 'package:expense_manager/providers/theme.dart';
import 'package:expense_manager/screens/create_category_screen.dart';
import 'package:expense_manager/screens/drawer_screen.dart';
import 'package:expense_manager/screens/signup_screen.dart';
import 'package:expense_manager/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final user = ref.watch(authProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      themeMode: theme == true ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(8, 131, 149, 1),
        ).copyWith(
          secondary: const Color.fromRGBO(55, 183, 195, 1),
          onPrimary: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: "Poppins",
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          size: 22,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(17, 50, 84, 1),
          primary: const Color.fromRGBO(17, 50, 84, 1),
          brightness: Brightness.dark,
          onPrimary: Colors.white,
          secondary: const Color.fromRGBO(50, 83, 116, 1),
        ),
        useMaterial3: true,
        fontFamily: "Poppins",
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          size: 22,
        ),
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
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        CreateCategoryScreen.routeName: (context) =>
            const CreateCategoryScreen(),
      },
    );
  }
}
