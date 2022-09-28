import 'package:flutter/material.dart';
import 'package:quranku/page/home_page.dart';
import 'package:quranku/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => const SplashScreen(),
        '/': (context) => const HomePage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
