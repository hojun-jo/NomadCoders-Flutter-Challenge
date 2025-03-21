import 'package:flutter/material.dart';
import 'package:pal_book/models/pal_model.dart';
import 'package:pal_book/views/widgets/elements_box.dart';

class DetailPage extends StatefulWidget {
  final PalModel pal;
  final String imagePath;
  final VoidCallback goHomePage;

  const DetailPage({
    super.key,
    required this.pal,
    required this.imagePath,
    required this.goHomePage,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 0) {
        widget.goHomePage();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
          spacing: 20,
          children: [
            Icon(Icons.arrow_drop_up, color: Colors.white),
            Image.asset(widget.imagePath),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                spacing: 10,
                children: [
                  Text(
                    widget.pal.name,
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  ElementsBox(elements: widget.pal.elements),
                  Text(
                    widget.pal.description,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
