import 'package:flutter/material.dart';
import 'package:pal_book/view_models/home_view_model.dart';
import 'package:pal_book/views/widgets/background_image.dart';
import 'package:pal_book/views/widgets/elements_box.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomePage({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel _viewModel;

  final PageController _backPageController = PageController();
  final PageController _frontPageController = PageController();

  String _currentPal = "1";

  @override
  void initState() {
    super.initState();

    _viewModel = widget.viewModel;

    _backPageController.addListener(() {
      _frontPageController.animateTo(
        _backPageController.offset,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    _backPageController.dispose();
    _frontPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return FutureBuilder(
      future: _viewModel.fetchPals(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!;

        return Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: BackgroundImage(
                key: ValueKey(_currentPal),
                path: _viewModel.getBackgroundImagePath(_currentPal),
              ),
            ),
            PageView.builder(
              controller: _backPageController,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final pal = data[index];

                _changeBackgroundImage(_backPageController.offset, size.width);

                return Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 280,
                        height: 360,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              spacing: 4,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(pal.name, style: TextStyle(fontSize: 36)),
                                ElementsBox(elements: pal.elements),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 80,
                        ),
                        child: Text(
                          pal.summary,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            IgnorePointer(
              child: PageView.builder(
                controller: _frontPageController,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final pal = data[index];

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: size.height / 3,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            _viewModel.getPalImagePath(pal.id),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _changeBackgroundImage(double offset, double width) {
    _currentPal = "${(offset / width).round() + 1}";
  }
}
