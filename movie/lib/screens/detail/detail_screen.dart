import 'package:assignment10/screens/detail/widgets/buy_ticket_button.dart';
import 'package:assignment10/screens/detail/widgets/runtime_genres_text.dart';
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
// TODO - rating star 직접 구현 -> ShaderMask면 될듯?
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
                // TODO - 위젯 분리
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
                              _Title(
                                title: snapshot.data!.$1.title,
                                size: 34,
                              ),
                              const SizedBox(height: 4),
                              RatingStars(
                                value: snapshot.data!.$1.voteAverage / 2,
                                valueLabelVisibility: false,
                                starSpacing: 8,
                              ),
                              const SizedBox(height: 24),
                              RuntimeGenresText(
                                runtime:
                                    _formatRuntime(snapshot.data!.$1.runtime),
                                genres: snapshot.data!.$2.reduce(
                                    (value, element) => "$value, $element"),
                                isAdult: snapshot.data!.$1.isAdult,
                              ),
                              const SizedBox(height: 40),
                              const _Title(
                                title: "Storyline",
                                size: 30,
                              ),
                              const SizedBox(height: 12),
                              _Title(
                                title: snapshot.data!.$1.overview,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                        const BuyTicketButton()
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

  String _formatRuntime(int runtime) {
    return "${runtime ~/ 60}h ${runtime % 60}min";
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
