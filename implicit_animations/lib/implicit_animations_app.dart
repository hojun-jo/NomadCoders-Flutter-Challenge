import 'package:flutter/material.dart';
import 'package:implicit_animations/home_page.dart';

class ImplicitAnimationsApp extends StatelessWidget {
  const ImplicitAnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Implicit Animations",
      home: Scaffold(body: HomePage()),
    );
  }
}
