import 'package:assignment10/screens/detail/widgets/rating_stars.dart';
import 'package:assignment10/screens/detail/widgets/runtime_genres_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class MovieInformationColumn extends StatelessWidget {
  final String movieTitle;
  final double rating;
  final String runtime;
  final String genres;
  final bool isAdult;
  final String overview;

  const MovieInformationColumn({
    super.key,
    required this.movieTitle,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.isAdult,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(
          title: movieTitle,
          size: 34,
        ),
        const SizedBox(height: 4),
        RatingStars(
          value: rating,
          valueLabelVisibility: false,
          starSpacing: 8,
        ),
        RatingStar(
          rating: rating,
        ),
        const SizedBox(height: 24),
        RuntimeGenresText(
          runtime: runtime,
          genres: genres,
          isAdult: isAdult,
        ),
        const SizedBox(height: 40),
        const _Title(
          title: "Storyline",
          size: 30,
        ),
        const SizedBox(height: 12),
        _Title(
          title: overview,
          size: 16,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
    required this.title,
    required this.size,
  });

  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
