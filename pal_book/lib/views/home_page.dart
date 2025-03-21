import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pal_book/view_models/home_view_model.dart';
import 'package:pal_book/views/detail_page.dart';
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
  bool _isShowDetail = false;

  @override
  void initState() {
    super.initState();

    _viewModel = widget.viewModel;

    _backPageController.addListener(() {
      _changeBackgroundImage(_backPageController.offset);
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

        return GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy < 0) {
              _isShowDetail = true;
            } else {
              _isShowDetail = false;
            }
            setState(() {});
          },
          child: Stack(
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
                                      Text(
                                        pal.name,
                                        style: TextStyle(fontSize: 36),
                                      ),
                                      ElementsBox(elements: pal.elements),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 80,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  pal.summary,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  )
                  .animate(target: _isShowDetail ? 1 : 0)
                  .slideY(begin: 0, end: -1),
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
                  )
                  .animate(target: _isShowDetail ? 1 : 0)
                  .slideY(begin: 0, end: -1),
              DetailPage(
                pal: data[int.parse(_currentPal) - 1],
                imagePath: _viewModel.getPalImagePath(
                  data[int.parse(_currentPal) - 1].id,
                ),
                goHomePage: () {
                  _isShowDetail = false;
                  setState(() {});
                },
              ).animate(target: _isShowDetail ? 1 : 0).slideY(begin: 1, end: 0),
            ],
          ),
        );
      },
    );
  }

  void _changeBackgroundImage(double offset) {
    final size = MediaQuery.sizeOf(context);
    _currentPal = "${(offset / size.width).round() + 1}";
    setState(() {});
  }
}
