import 'package:assignment10/models/movie_summery.dart';
import 'package:assignment10/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class MovieImageCard extends StatelessWidget {
  final MovieSummery movie;
  final double width;
  final double height;

  const MovieImageCard({
    super.key,
    required this.movie,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(id: movie.id),
          ),
        );
      },
      child: Container(
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          "https://image.tmdb.org/t/p/w500/${movie.imagePath}",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
