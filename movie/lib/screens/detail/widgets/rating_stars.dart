import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final double rating;

  RatingStar({
    super.key,
    required this.rating,
  });

  final GlobalKey _starsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stars(
          key: _starsKey,
          color: Colors.white30,
        ),
        FutureBuilder(
          future: _getSize(
              _starsKey), // 최초 빌드시 사이즈를 구하기 전에 _starsKey.currentContext가 null이기 때문에 리빌드를 위해 Future 사용
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ClipPath(
                clipper: RatingStarsClipper(
                  width: snapshot.data!.width *
                      rating /
                      5, // 평점이 5점 기준으로 들어오기 때문에 5로 나눔
                ),
                child: const Stars(color: Colors.yellow),
              );
            }
            return Container();
          },
        )
      ],
    );
  }

  Future<Size> _getSize(GlobalKey key) async {
    if (key.currentContext == null) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    return size;
  }
}

class RatingStarsClipper extends CustomClipper<Path> {
  final double width;

  RatingStarsClipper({
    super.reclip,
    required this.width,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(width, 0);
    path.lineTo(width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Stars extends StatelessWidget {
  final Color color;

  const Stars({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          Icon(
            Icons.star,
            size: 28,
            color: color,
          ),
      ],
    );
  }
}
