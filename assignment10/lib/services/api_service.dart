import 'dart:convert';

import 'package:assignment10/models/movie_detail.dart';
import 'package:assignment10/models/movie_summery.dart';
import 'package:http/http.dart' as http;

typedef MovieDetails = (MovieDetail, List<String>);

enum MovieListPath {
  popular("popular"),
  nowPlaying("now-playing"),
  comingSoon("coming-soon");

  const MovieListPath(this.string);

  final String string;
}

class ApiService {
  static const baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const detail = "movie?id=";

  static Future<List<MovieSummery>> getMovieList(MovieListPath path) async {
    List<MovieSummery> movieList = [];
    final url = Uri.parse("$baseUrl/${path.string}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      for (var movie in json["results"]) {
        movieList.add(MovieSummery.fromJson(movie));
      }
      return movieList;
    }
    throw Error();
  }

  static Future<MovieDetails> getMovieDetail(int id) async {
    List<String> genres = [];
    final url = Uri.parse("$baseUrl/$detail$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final movie = MovieDetail.fromJson(json);
      for (var genre in json["genres"]) {
        genres.add(genre["name"]);
      }
      return (movie, genres);
    }
    throw Error();
  }
}
