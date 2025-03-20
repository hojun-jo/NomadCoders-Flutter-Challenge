import 'package:flutter/material.dart';
import 'package:pal_book/view_models/home_view_model.dart';
import 'package:pal_book/views/home_page.dart';

class PalBookApp extends StatelessWidget {
  const PalBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pal Book",
      home: Scaffold(body: HomePage(viewModel: HomeViewModel())),
    );
  }
}
