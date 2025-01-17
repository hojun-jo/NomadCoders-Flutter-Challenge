class MovieDetail {
  final int id;
  final String title;
  final String posterPath;
  final bool isAdult;
  final String overview;
  final int runtime;
  final double voteAverage;

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        posterPath = json['poster_path'],
        isAdult = json['adult'],
        overview = json['overview'],
        runtime = json['runtime'],
        voteAverage = json['vote_average'];
}
