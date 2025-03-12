import 'package:explicit_animations/view/home_page.dart';
import 'package:flutter/material.dart';

class ExplicitAnimationsApp extends StatelessWidget {
  const ExplicitAnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Explicit Animations",
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: HomePage()),
      ),
    );
  }
}
