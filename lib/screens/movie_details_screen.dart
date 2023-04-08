import 'package:flutter/material.dart';
import 'package:flutter_1/models/actor_model.dart';
import 'package:flutter_1/models/popular_model.dart';
import 'package:flutter_1/network/api_popular.dart';
import 'package:flutter_1/widgets/actor_card_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatelessWidget {
  ApiPopular apiPopular = ApiPopular();

  final PopularModel popularModel;
  MovieDetailScreen({Key? key, required this.popularModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 16, 18, 54)
                /* image: DecorationImage(
                opacity: .9,
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/' + popularModel.backdropPath!,
                ),
              ), */
                ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                SizedBox(height: 10),
                Text(
                  popularModel.title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 16, 18, 54),
                  ),
                ),
                const SizedBox(height: 20),
                Image(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500/${popularModel.backdropPath!}')),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      popularModel.voteAverage!.toString(),
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 16, 18, 54),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Sinopsis',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 16, 18, 54),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  popularModel.overview!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 16, 18, 54),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Trailer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 16, 18, 54),
                  ),
                ),
                const SizedBox(height: 10),
                FutureBuilder(
                  future: apiPopular.getIdVideo(popularModel.id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: snapshot.data.toString(),
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            controlsVisibleAtStart: true,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.white,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Actores',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 16, 18, 54),
                  ),
                ),
                const SizedBox(height: 10),
                FutureBuilder<List<ActorModel>?>(
                  future: apiPopular.getCast(popularModel),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            ActorModel actor = snapshot.data![index];
                            return ActorCard(
                              name: actor.name!,
                              photoUrl:
                                  'https://image.tmdb.org/t/p/original${actor.profilePath}',
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
