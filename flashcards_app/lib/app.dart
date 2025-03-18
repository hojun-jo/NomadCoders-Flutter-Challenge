import 'package:flashcards_app/view_models/home_view_model.dart';
import 'package:flashcards_app/views/home_page.dart';
import 'package:flutter/material.dart';

class FlashcardsApp extends StatelessWidget {
  const FlashcardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flashcards App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: Scaffold(body: HomePage(viewModel: HomeViewModel())),
    );
  }
}
