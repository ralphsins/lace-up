import 'package:flutter/material.dart';
import 'package:senior_shabeb/colors/colors.dart';
import 'package:senior_shabeb/pages/auth/login_page.dart';
import 'package:senior_shabeb/pages/Explore/explore.dart';
import 'package:senior_shabeb/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int indexMenu = 0;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.primary),
      ),
      routes: {
        "home": (context) => const HomePage(),
        "explore": (context) => const Explore(),
        // "about": (context) => const AboutUs(),
        // "page1": (context) => const Pageone(),
        // "page2": (context) => const Pagetwo(),
      },
    );
  }
}
