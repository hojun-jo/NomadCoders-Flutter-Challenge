class MovieSummery {
  final int id;
  final String title;
  final String imagePath;

  MovieSummery.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imagePath = json['backdrop_path'];
}
