import 'package:flutter/material.dart';
import '../screen/homeScreen.dart';

// Remove ALL overscroll effects
class NoOverscrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // return child as-is, no glow or stretch
  }
}

class ITEStoreApp extends StatelessWidget {
  const ITEStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITE Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)),
        useMaterial3: true,
      ),
      // Wrap with ScrollConfiguration to apply globally
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoOverscrollBehavior(),
          child: child!,
        );
      },
      home: const HomeScreen(),
    );
  }
}