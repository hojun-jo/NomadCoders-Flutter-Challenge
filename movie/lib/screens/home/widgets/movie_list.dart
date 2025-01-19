import 'package:assignment10/models/movie_summery.dart';
import 'package:assignment10/screens/home/widgets/large_image_card.dart';
import 'package:assignment10/screens/home/widgets/small_image_title_card.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final Future<List<MovieSummery>> list;
  final bool isLarge;

  const MovieList({
    super.key,
    required this.list,
    required this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLarge ? 200 : 230,
      child: FutureBuilder(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];

                return isLarge
                    ? LargeImageCard(
                        movie: movie,
                        width: 300,
                        height: 200,
                      )
                    : SmallImageTitleCard(movie: movie);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 30),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
