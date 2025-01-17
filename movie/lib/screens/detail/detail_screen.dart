import 'package:assignment10/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  late final Future<MovieDetails> detail = ApiService.getMovieDetail(id);

  DetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: detail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/${snapshot.data!.$1.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black45,
              ),
              Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  title: const Text(
                    "Back to list",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: false,
                ),
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _title(snapshot.data!.$1.title, 34),
                              const SizedBox(height: 4),
                              RatingStars(
                                value: snapshot.data!.$1.voteAverage / 2,
                                valueLabelVisibility: false,
                                starSpacing: 8,
                              ),
                              const SizedBox(height: 24),
                              _runtimeGenres(snapshot),
                              const SizedBox(height: 40),
                              _title("Storyline", 30),
                              const SizedBox(height: 12),
                              _title(snapshot.data!.$1.overview, 16),
                            ],
                          ),
                        ),
                        _buyTicketButton()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  RichText _runtimeGenres(AsyncSnapshot<MovieDetails> snapshot) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white,
        ),
        children: [
          TextSpan(text: _formatRuntime(snapshot.data!.$1.runtime)),
          const TextSpan(text: " ⎮ "),
          TextSpan(
            text: snapshot.data!.$2
                .reduce((value, element) => "$value, $element"),
          ),
          if (snapshot.data!.$1.isAdult) const TextSpan(text: "🔞"),
        ],
      ),
    );
  }

  Row _buyTicketButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "Buy ticket",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Text _title(String title, double size) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  String _formatRuntime(int runtime) {
    return "${runtime ~/ 60}h ${runtime % 60}min";
  }
}
