import 'package:flutter/material.dart';
import 'package:pal_book/models/pal_model.dart';
import 'package:pal_book/view_models/detail_view_model.dart';
import 'package:pal_book/views/widgets/elements_box.dart';
import 'package:pal_book/views/widgets/tint_container.dart';
import 'package:pal_book/views/widgets/work_suitability_item.dart';

class DetailPage extends StatefulWidget {
  final PalModel pal;
  final String imagePath;
  final VoidCallback goHomePage;
  final DetailViewModel viewModel;

  const DetailPage({
    super.key,
    required this.pal,
    required this.imagePath,
    required this.goHomePage,
    required this.viewModel,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final _viewModel = widget.viewModel;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < -30) {
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
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
          spacing: 20,
          children: [
            Icon(Icons.arrow_drop_up, color: Colors.white),
            Image.asset(widget.imagePath),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 10,
                children: [
                  TintContainer(
                    width: size.width,
                    child: Text(
                      widget.pal.name,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  TintContainer(
                    child: ElementsBox(elements: widget.pal.elements),
                  ),
                  TintContainer(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 5,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: [
                        ...widget.pal.workSuitability.entries.map((entry) {
                          return WorkSuitabilityItem(
                            imagePath: _viewModel.getWorkSuitabilityImagePath(
                              entry.key,
                            ),
                            text: _viewModel.workSuitabilityToString(entry.key),
                            level: entry.value,
                          );
                        }),
                      ],
                    ),
                  ),
                  TintContainer(
                    child: Text(
                      widget.pal.description,
                      style: TextStyle(color: Colors.white),
                    ),
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
