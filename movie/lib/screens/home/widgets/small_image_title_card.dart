import 'package:assignment10/models/movie_summery.dart';
import 'package:assignment10/screens/home/movie_image_card.dart';
import 'package:flutter/material.dart';

class SmallImageTitleCard extends StatelessWidget {
  final MovieSummery movie;

  const SmallImageTitleCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieImageCard(
            movie: movie,
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
