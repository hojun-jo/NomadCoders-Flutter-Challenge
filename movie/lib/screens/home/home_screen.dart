import 'package:assignment10/models/movie_summery.dart';
import 'package:assignment10/screens/home/widgets/movie_list.dart';
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
            MovieList(list: popularList, isLarge: true),
            const _Title("Now in Cinemas"),
            MovieList(list: nowPlaying, isLarge: false),
            const _Title("Coming soon"),
            MovieList(list: comingSoon, isLarge: false),
          ],
        ),
      ),
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
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
