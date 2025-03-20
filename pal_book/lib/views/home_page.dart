import 'package:flutter/material.dart';
import 'package:pal_book/view_models/home_view_model.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomePage({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _viewModel.fetchPals(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(child: Text("data"));
      },
    );
  }
}
