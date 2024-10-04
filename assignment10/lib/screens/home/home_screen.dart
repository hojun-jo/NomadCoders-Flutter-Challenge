import 'package:assignment10/models/movie_summery.dart';
import 'package:assignment10/screens/home/movie_image_card.dart';
import 'package:assignment10/screens/home/small_image_title_card.dart';
import 'package:assignment10/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Future<List<MovieSummery>> popularList =
      ApiService.getMovieList(MovieListPath.popular);
  final Future<List<MovieSummery>> nowPlaying =
      ApiService.getMovieList(MovieListPath.nowPlaying);
  final Future<List<MovieSummery>> comingSoon =
      ApiService.getMovieList(MovieListPath.comingSoon);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Title("Popular Movies"),
            makeMovieList(
              list: popularList,
              isLarge: true,
            ),
            const _Title("Now in Cinemas"),
            makeMovieList(
              list: nowPlaying,
              isLarge: false,
            ),
            const _Title("Coming soon"),
            makeMovieList(
              list: comingSoon,
              isLarge: false,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox makeMovieList(
      {required Future<List<MovieSummery>> list, required bool isLarge}) {
    return SizedBox(
      height: isLarge ? 200 : 230,
      child: FutureBuilder(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return makeList(snapshot, isLarge: isLarge);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget makeList(AsyncSnapshot<List<MovieSummery>> snapshot,
      {required bool isLarge}) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final movie = snapshot.data![index];
        if (isLarge) {
          return MovieImageCard(
            movie: movie,
            width: 300,
            height: 200,
          );
        } else {
          return SmallImageTitleCard(movie: movie);
        }
      },
      separatorBuilder: (context, index) => const SizedBox(width: 30),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
