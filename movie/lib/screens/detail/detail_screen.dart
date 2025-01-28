import 'package:assignment10/screens/detail/widgets/buy_ticket_button.dart';
import 'package:assignment10/screens/detail/widgets/movie_information_column.dart';
import 'package:assignment10/services/api_service.dart';
import 'package:flutter/material.dart';

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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                          ),
                          MovieInformationColumn(
                            movieTitle: snapshot.data!.$1.title,
                            rating: snapshot.data!.$1.voteAverage / 2,
                            runtime: _formatRuntime(snapshot.data!.$1.runtime),
                            genres: snapshot.data!.$2
                                .reduce((value, element) => "$value, $element"),
                            isAdult: snapshot.data!.$1.isAdult,
                            overview: snapshot.data!.$1.overview,
                          ),
                          const BuyTicketButton()
                        ],
                      ),
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
